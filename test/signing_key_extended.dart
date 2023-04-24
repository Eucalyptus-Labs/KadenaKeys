import 'package:pinenacl/ed25519.dart';
import 'package:pinenacl/src/tweetnacl/tweetnacl.dart';
import 'dart:developer' as developer;

// ignore: depend_on_referenced_packages
import 'package:convert/convert.dart';

// ignore_for_file: constant_identifier_names, non_constant_identifier_names

class TweetNaClPubKey {
  static final _gf0 =
      Int32List.fromList([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]); //16

  static final _gf1 =
      Int32List.fromList([1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]); //16

  static final _D2 = Int32List.fromList([
    0xf159, 0x26b2, 0x9b94, 0xebd6, // 0-3
    0xb156, 0x8283, 0x149a, 0x00e0,
    0xd130, 0xeef3, 0x80f2, 0x198e,
    0xfce7, 0x56df, 0xd9dc, 0x2406
  ]);

  static final _X = Int32List.fromList([
    0xd51a, 0x8f25, 0x2d60, 0xc956, // 0-3
    0xa7b2, 0x9525, 0xc760, 0x692c,
    0xdc5c, 0xfdd6, 0xe231, 0xc0a4,
    0x53fe, 0xcd6e, 0x36d3, 0x2169
  ]);

  static final _Y = Int32List.fromList([
    0x6658, 0x6666, 0x6666, 0x6666, // 0-3
    0x6666, 0x6666, 0x6666, 0x6666,
    0x6666, 0x6666, 0x6666, 0x6666,
    0x6666, 0x6666, 0x6666, 0x6666
  ]);

  static void _set25519(Int32List r, Int32List a) {
    int i;

    for (i = 0; i < 16; i++) {
      r[i] = a[i];
    }
  }

  static void _car25519(Int32List o) {
    int i;
    int v, c = 1;

    for (i = 0; i < 16; i++) {
      v = o[i] + c + 0xffff;
      c = v ~/ 0x10000;
      o[i] = v - c * 0x10000;
    }

    o[0] += c - 1 + 37 * (c - 1);
  }

  static void _sel25519_off(
      Int32List p, final int poff, Int32List q, final int qoff, final int b) {
    int t, c = ~(b - 1);

    for (var i = 0; i < 16; i++) {
      t = c & (p[i + poff] ^ q[i + qoff]);
      p[i + poff] = p[i + poff] ^ t;
      q[i + qoff] = q[i + qoff] ^ t;
    }
  }

  static void _pack25519(Uint8List o, Int32List n, final int noff) {
    final m = Int32List(16), t = Int32List(16);

    for (var i = 0; i < 16; i++) {
      t[i] = n[i + noff];
    }

    _car25519(t);
    _car25519(t);
    _car25519(t);

    for (var j = 0; j < 2; j++) {
      m[0] = t[0] - 0xffed;

      for (var i = 1; i < 15; i++) {
        m[i] = t[i] - 0xffff - ((m[i - 1] >> 16) & 1);
        m[i - 1] &= 0xffff;
      }

      m[15] = t[15] - 0x7fff - ((m[14] >> 16) & 1);

      final b = ((m[15] >> 16) & 1);
      m[14] &= 0xffff;
      _sel25519_off(t, 0, m, 0, 1 - b);
    }

    for (var i = 0; i < 16; i++) {
      o[2 * i] = t[i] & 0xff;
      o[2 * i + 1] = (t[i] >> 8);
    }
  }

  static int _par25519_off(Int32List a, final int aoff) {
    final d = Uint8List(32);

    _pack25519(d, a, aoff);

    return (d[0] & 1);
  }

  static void _A_off(Int32List o, final int ooff, Int32List a, final int aoff,
      Int32List b, final int boff) {
    int i;

    for (i = 0; i < 16; i++) {
      o[i + ooff] = a[i + aoff] + b[i + boff];
    }
  }

  static void _Z_off(Int32List o, final int ooff, Int32List a, final int aoff,
      Int32List b, final int boff) {
    int i;
    for (i = 0; i < 16; i++) {
      o[i + ooff] = a[i + aoff] - b[i + boff];
    }
  }

  ///
  /// It Calculates the `(a * b) mod (2^256 - 38)` instead of the `2^255-19`.
  /// The reason is explained in the following paper

  /// Reference:
  /// High-speed Curve25519 on 8-bit, 16-bit, and 32-bit microcontrollers
  /// https://link.springer.com/article/10.1007/s10623-015-0087-1
  static void _M_off(Int32List o, final int ooff, Int32List a, final int aoff,
      Int32List b, final int boff) {
    var t0 = 0,
        t1 = 0,
        t2 = 0,
        t3 = 0,
        t4 = 0,
        t5 = 0,
        t6 = 0,
        t7 = 0,
        t8 = 0,
        t9 = 0,
        t10 = 0,
        t11 = 0,
        t12 = 0,
        t13 = 0,
        t14 = 0,
        t15 = 0,
        t16 = 0,
        t17 = 0,
        t18 = 0,
        t19 = 0,
        t20 = 0,
        t21 = 0,
        t22 = 0,
        t23 = 0,
        t24 = 0,
        t25 = 0,
        t26 = 0,
        t27 = 0,
        t28 = 0,
        t29 = 0,
        t30 = 0,
        b0 = b[0 + boff],
        b1 = b[1 + boff],
        b2 = b[2 + boff],
        b3 = b[3 + boff],
        b4 = b[4 + boff],
        b5 = b[5 + boff],
        b6 = b[6 + boff],
        b7 = b[7 + boff],
        b8 = b[8 + boff],
        b9 = b[9 + boff],
        b10 = b[10 + boff],
        b11 = b[11 + boff],
        b12 = b[12 + boff],
        b13 = b[13 + boff],
        b14 = b[14 + boff],
        b15 = b[15 + boff];

    var v = a[0 + aoff];

    t0 += v * b0;
    t1 += v * b1;
    t2 += v * b2;
    t3 += v * b3;
    t4 += v * b4;
    t5 += v * b5;
    t6 += v * b6;
    t7 += v * b7;
    t8 += v * b8;
    t9 += v * b9;
    t10 += v * b10;
    t11 += v * b11;
    t12 += v * b12;
    t13 += v * b13;
    t14 += v * b14;
    t15 += v * b15;

    v = a[1 + aoff];

    t1 += v * b0;
    t2 += v * b1;
    t3 += v * b2;
    t4 += v * b3;
    t5 += v * b4;
    t6 += v * b5;
    t7 += v * b6;
    t8 += v * b7;
    t9 += v * b8;
    t10 += v * b9;
    t11 += v * b10;
    t12 += v * b11;
    t13 += v * b12;
    t14 += v * b13;
    t15 += v * b14;
    t16 += v * b15;

    v = a[2 + aoff];

    t2 += v * b0;
    t3 += v * b1;
    t4 += v * b2;
    t5 += v * b3;
    t6 += v * b4;
    t7 += v * b5;
    t8 += v * b6;
    t9 += v * b7;
    t10 += v * b8;
    t11 += v * b9;
    t12 += v * b10;
    t13 += v * b11;
    t14 += v * b12;
    t15 += v * b13;
    t16 += v * b14;
    t17 += v * b15;

    v = a[3 + aoff];

    t3 += v * b0;
    t4 += v * b1;
    t5 += v * b2;
    t6 += v * b3;
    t7 += v * b4;
    t8 += v * b5;
    t9 += v * b6;
    t10 += v * b7;
    t11 += v * b8;
    t12 += v * b9;
    t13 += v * b10;
    t14 += v * b11;
    t15 += v * b12;
    t16 += v * b13;
    t17 += v * b14;
    t18 += v * b15;

    v = a[4 + aoff];

    t4 += v * b0;
    t5 += v * b1;
    t6 += v * b2;
    t7 += v * b3;
    t8 += v * b4;
    t9 += v * b5;
    t10 += v * b6;
    t11 += v * b7;
    t12 += v * b8;
    t13 += v * b9;
    t14 += v * b10;
    t15 += v * b11;
    t16 += v * b12;
    t17 += v * b13;
    t18 += v * b14;
    t19 += v * b15;

    v = a[5 + aoff];

    t5 += v * b0;
    t6 += v * b1;
    t7 += v * b2;
    t8 += v * b3;
    t9 += v * b4;
    t10 += v * b5;
    t11 += v * b6;
    t12 += v * b7;
    t13 += v * b8;
    t14 += v * b9;
    t15 += v * b10;
    t16 += v * b11;
    t17 += v * b12;
    t18 += v * b13;
    t19 += v * b14;
    t20 += v * b15;

    v = a[6 + aoff];

    t6 += v * b0;
    t7 += v * b1;
    t8 += v * b2;
    t9 += v * b3;
    t10 += v * b4;
    t11 += v * b5;
    t12 += v * b6;
    t13 += v * b7;
    t14 += v * b8;
    t15 += v * b9;
    t16 += v * b10;
    t17 += v * b11;
    t18 += v * b12;
    t19 += v * b13;
    t20 += v * b14;
    t21 += v * b15;

    v = a[7 + aoff];

    t7 += v * b0;
    t8 += v * b1;
    t9 += v * b2;
    t10 += v * b3;
    t11 += v * b4;
    t12 += v * b5;
    t13 += v * b6;
    t14 += v * b7;
    t15 += v * b8;
    t16 += v * b9;
    t17 += v * b10;
    t18 += v * b11;
    t19 += v * b12;
    t20 += v * b13;
    t21 += v * b14;
    t22 += v * b15;

    v = a[8 + aoff];

    t8 += v * b0;
    t9 += v * b1;
    t10 += v * b2;
    t11 += v * b3;
    t12 += v * b4;
    t13 += v * b5;
    t14 += v * b6;
    t15 += v * b7;
    t16 += v * b8;
    t17 += v * b9;
    t18 += v * b10;
    t19 += v * b11;
    t20 += v * b12;
    t21 += v * b13;
    t22 += v * b14;
    t23 += v * b15;

    v = a[9 + aoff];

    t9 += v * b0;
    t10 += v * b1;
    t11 += v * b2;
    t12 += v * b3;
    t13 += v * b4;
    t14 += v * b5;
    t15 += v * b6;
    t16 += v * b7;
    t17 += v * b8;
    t18 += v * b9;
    t19 += v * b10;
    t20 += v * b11;
    t21 += v * b12;
    t22 += v * b13;
    t23 += v * b14;
    t24 += v * b15;

    v = a[10 + aoff];

    t10 += v * b0;
    t11 += v * b1;
    t12 += v * b2;
    t13 += v * b3;
    t14 += v * b4;
    t15 += v * b5;
    t16 += v * b6;
    t17 += v * b7;
    t18 += v * b8;
    t19 += v * b9;
    t20 += v * b10;
    t21 += v * b11;
    t22 += v * b12;
    t23 += v * b13;
    t24 += v * b14;
    t25 += v * b15;

    v = a[11 + aoff];

    t11 += v * b0;
    t12 += v * b1;
    t13 += v * b2;
    t14 += v * b3;
    t15 += v * b4;
    t16 += v * b5;
    t17 += v * b6;
    t18 += v * b7;
    t19 += v * b8;
    t20 += v * b9;
    t21 += v * b10;
    t22 += v * b11;
    t23 += v * b12;
    t24 += v * b13;
    t25 += v * b14;
    t26 += v * b15;

    v = a[12 + aoff];

    t12 += v * b0;
    t13 += v * b1;
    t14 += v * b2;
    t15 += v * b3;
    t16 += v * b4;
    t17 += v * b5;
    t18 += v * b6;
    t19 += v * b7;
    t20 += v * b8;
    t21 += v * b9;
    t22 += v * b10;
    t23 += v * b11;
    t24 += v * b12;
    t25 += v * b13;
    t26 += v * b14;
    t27 += v * b15;

    v = a[13 + aoff];

    t13 += v * b0;
    t14 += v * b1;
    t15 += v * b2;
    t16 += v * b3;
    t17 += v * b4;
    t18 += v * b5;
    t19 += v * b6;
    t20 += v * b7;
    t21 += v * b8;
    t22 += v * b9;
    t23 += v * b10;
    t24 += v * b11;
    t25 += v * b12;
    t26 += v * b13;
    t27 += v * b14;
    t28 += v * b15;

    v = a[14 + aoff];

    t14 += v * b0;
    t15 += v * b1;
    t16 += v * b2;
    t17 += v * b3;
    t18 += v * b4;
    t19 += v * b5;
    t20 += v * b6;
    t21 += v * b7;
    t22 += v * b8;
    t23 += v * b9;
    t24 += v * b10;
    t25 += v * b11;
    t26 += v * b12;
    t27 += v * b13;
    t28 += v * b14;
    t29 += v * b15;

    v = a[15 + aoff];

    t15 += v * b0;
    t16 += v * b1;
    t17 += v * b2;
    t18 += v * b3;
    t19 += v * b4;
    t20 += v * b5;
    t21 += v * b6;
    t22 += v * b7;
    t23 += v * b8;
    t24 += v * b9;
    t25 += v * b10;
    t26 += v * b11;
    t27 += v * b12;
    t28 += v * b13;
    t29 += v * b14;
    t30 += v * b15;

    t0 += 38 * t16;
    t1 += 38 * t17;
    t2 += 38 * t18;
    t3 += 38 * t19;
    t4 += 38 * t20;
    t5 += 38 * t21;
    t6 += 38 * t22;
    t7 += 38 * t23;
    t8 += 38 * t24;
    t9 += 38 * t25;
    t10 += 38 * t26;
    t11 += 38 * t27;
    t12 += 38 * t28;
    t13 += 38 * t29;
    t14 += 38 * t30;

    var c = 1;
    v = t0 + c + 0xffff;
    c = v ~/ 0x10000;
    t0 = v - c * 0x10000;
    v = t1 + c + 0xffff;
    c = v ~/ 0x10000;
    t1 = v - c * 0x10000;
    v = t2 + c + 0xffff;
    c = v ~/ 0x10000;
    t2 = v - c * 0x10000;
    v = t3 + c + 0xffff;
    c = v ~/ 0x10000;
    t3 = v - c * 0x10000;
    v = t4 + c + 0xffff;
    c = v ~/ 0x10000;
    t4 = v - c * 0x10000;
    v = t5 + c + 0xffff;
    c = v ~/ 0x10000;
    t5 = v - c * 0x10000;
    v = t6 + c + 0xffff;
    c = v ~/ 0x10000;
    t6 = v - c * 0x10000;
    v = t7 + c + 0xffff;
    c = v ~/ 0x10000;
    t7 = v - c * 0x10000;
    v = t8 + c + 0xffff;
    c = v ~/ 0x10000;
    t8 = v - c * 0x10000;
    v = t9 + c + 0xffff;
    c = v ~/ 0x10000;
    t9 = v - c * 0x10000;
    v = t10 + c + 0xffff;
    c = v ~/ 0x10000;
    t10 = v - c * 0x10000;
    v = t11 + c + 0xffff;
    c = v ~/ 0x10000;
    t11 = v - c * 0x10000;
    v = t12 + c + 0xffff;
    c = v ~/ 0x10000;
    t12 = v - c * 0x10000;
    v = t13 + c + 0xffff;
    c = v ~/ 0x10000;
    t13 = v - c * 0x10000;
    v = t14 + c + 0xffff;
    c = v ~/ 0x10000;
    t14 = v - c * 0x10000;
    v = t15 + c + 0xffff;
    c = v ~/ 0x10000;
    t15 = v - c * 0x10000;
    t0 += 38 * (c - 1);

    c = 1;
    v = t0 + c + 0xffff;
    c = v ~/ 0x10000;
    t0 = v - c * 0x10000;
    v = t1 + c + 0xffff;
    c = v ~/ 0x10000;
    t1 = v - c * 0x10000;
    v = t2 + c + 0xffff;
    c = v ~/ 0x10000;
    t2 = v - c * 0x10000;
    v = t3 + c + 0xffff;
    c = v ~/ 0x10000;
    t3 = v - c * 0x10000;
    v = t4 + c + 0xffff;
    c = v ~/ 0x10000;
    t4 = v - c * 0x10000;
    v = t5 + c + 0xffff;
    c = v ~/ 0x10000;
    t5 = v - c * 0x10000;
    v = t6 + c + 0xffff;
    c = v ~/ 0x10000;
    t6 = v - c * 0x10000;
    v = t7 + c + 0xffff;
    c = v ~/ 0x10000;
    t7 = v - c * 0x10000;
    v = t8 + c + 0xffff;
    c = v ~/ 0x10000;
    t8 = v - c * 0x10000;
    v = t9 + c + 0xffff;
    c = v ~/ 0x10000;
    t9 = v - c * 0x10000;
    v = t10 + c + 0xffff;
    c = v ~/ 0x10000;
    t10 = v - c * 0x10000;
    v = t11 + c + 0xffff;
    c = v ~/ 0x10000;
    t11 = v - c * 0x10000;
    v = t12 + c + 0xffff;
    c = v ~/ 0x10000;
    t12 = v - c * 0x10000;
    v = t13 + c + 0xffff;
    c = v ~/ 0x10000;
    t13 = v - c * 0x10000;
    v = t14 + c + 0xffff;
    c = v ~/ 0x10000;
    t14 = v - c * 0x10000;
    v = t15 + c + 0xffff;
    c = v ~/ 0x10000;
    t15 = v - c * 0x10000;
    t0 += 38 * (c - 1);

    o[0 + ooff] = t0;
    o[1 + ooff] = t1;
    o[2 + ooff] = t2;
    o[3 + ooff] = t3;
    o[4 + ooff] = t4;
    o[5 + ooff] = t5;
    o[6 + ooff] = t6;
    o[7 + ooff] = t7;
    o[8 + ooff] = t8;
    o[9 + ooff] = t9;
    o[10 + ooff] = t10;
    o[11 + ooff] = t11;
    o[12 + ooff] = t12;
    o[13 + ooff] = t13;
    o[14 + ooff] = t14;
    o[15 + ooff] = t15;
  }

  static void _S_off(Int32List o, final int ooff, Int32List a, final int aoff) {
    _M_off(o, ooff, a, aoff, a, aoff);
  }

  static void _inv25519(
      Int32List o, final int ooff, Int32List i, final int ioff) {
    final c = Int32List(16);

    int a;
    for (a = 0; a < 16; a++) {
      c[a] = i[a + ioff];
    }
    for (a = 253; a >= 0; a--) {
      _S_off(c, 0, c, 0);
      if (a != 2 && a != 4) _M_off(c, 0, c, 0, i, ioff);
    }
    for (a = 0; a < 16; a++) {
      o[a + ooff] = c[a];
    }
  }

  static int _shr32(int x, int n) => (x & 0xffffffff) >> n;

  static void _add(List<Int32List> p, List<Int32List> q) {
    final a = Int32List(16);
    final b = Int32List(16);
    final c = Int32List(16);
    final d = Int32List(16);
    final t = Int32List(16);
    final e = Int32List(16);
    final f = Int32List(16);
    final g = Int32List(16);
    final h = Int32List(16);

    final p0 = p[0];
    final p1 = p[1];
    final p2 = p[2];
    final p3 = p[3];

    final q0 = q[0];
    final q1 = q[1];
    final q2 = q[2];
    final q3 = q[3];

    _Z_off(a, 0, p1, 0, p0, 0);
    _Z_off(t, 0, q1, 0, q0, 0);
    _M_off(a, 0, a, 0, t, 0);
    _A_off(b, 0, p0, 0, p1, 0);
    _A_off(t, 0, q0, 0, q1, 0);
    _M_off(b, 0, b, 0, t, 0);
    _M_off(c, 0, p3, 0, q3, 0);
    _M_off(c, 0, c, 0, _D2, 0);
    _M_off(d, 0, p2, 0, q2, 0);

    _A_off(d, 0, d, 0, d, 0);
    _Z_off(e, 0, b, 0, a, 0);
    _Z_off(f, 0, d, 0, c, 0);
    _A_off(g, 0, d, 0, c, 0);
    _A_off(h, 0, b, 0, a, 0);

    _M_off(p0, 0, e, 0, f, 0);
    _M_off(p1, 0, h, 0, g, 0);
    _M_off(p2, 0, g, 0, f, 0);
    _M_off(p3, 0, e, 0, h, 0);
  }

  static void _cswap(List<Int32List> p, List<Int32List> q, int b) {
    for (var i = 0; i < 4; i++) {
      _sel25519_off(p[i], 0, q[i], 0, b);
    }
  }

  static void _pack(Uint8List r, List<Int32List> p) {
    final tx = Int32List(16);
    final ty = Int32List(16);
    final zi = Int32List(16);

    _inv25519(zi, 0, p[2], 0);

    _M_off(tx, 0, p[0], 0, zi, 0);
    _M_off(ty, 0, p[1], 0, zi, 0);

    _pack25519(r, ty, 0);

    r[31] ^= _par25519_off(tx, 0) << 7;
  }

  static void _scalarmult(
      List<Int32List> p, List<Int32List> q, Uint8List s, final int soff) {
    int i;

    _set25519(p[0], _gf0);
    _set25519(p[1], _gf1);
    _set25519(p[2], _gf1);
    _set25519(p[3], _gf0);

    for (i = 255; i >= 0; --i) {
      final b = _shr32(s[(i >> 3) + soff], i & 7) & 1;

      _cswap(p, q, b);
      _add(q, p);
      _add(p, p);
      _cswap(p, q, b);
    }
  }

  static void _scalarbase(List<Int32List> p, Uint8List s, final int soff) {
    final q = List<Int32List>.generate(4, (_) => Int32List(16));

    _set25519(q[0], _X);
    _set25519(q[1], _Y);
    _set25519(q[2], _gf1);
    _M_off(q[3], 0, _X, 0, _Y, 0);
    _scalarmult(p, q, s, soff);
  }

  ///
  /// The `crypto_sign_keypair` function randomly generates a secret key and a corresponding public key.
  /// It puts the secret key into `sk` and public key into `pk`.
  /// It returns 0 on success.
  ///
  static int crypto_gen_pubkey(Uint8List pk, Uint8List sk) {
    final k = Uint8List(64);
    final p = List<Int32List>.generate(4, (_) => Int32List(16));

    for (int i = 0; i < 32; i++) {
      k[i] = sk[i];
    }

    _scalarbase(p, k, 0);
    _pack(pk, p);

    return 0;
  }
}

///
/// SigningKey implements the Ed25519 deterministic signature scheme (EdDSA)
/// using Curve25519, that provides a very fast `fixed-base` and `double-base`
/// scalar multiplications, which faster on most platform than the
/// `variable-base` algorithm of X25519, due to the fast and complete twisted
/// Edwards addition law.
///
/// Cannot extends `AsymmetricPrivateKey` as it would have to implement
/// the final `publicKey`.
///
class ExtendedSigningKey extends AsymmetricPrivateKey
    with Suffix
    implements Sign {
  /// An Ed25519 signingKey is the private key for producing digital signatures
  /// using the Ed25519 algorithm.
  ///  simply the concatenation of the seed and
  /// the generated public key from the `SHA512`-ed and `prone-to-buffer`-ed
  /// seed as a private key.
  ///
  /// seed (i.e. private key) is a random 32-byte value.

  final bool isExtended;

  factory ExtendedSigningKey({required Uint8List secret}) {
    if (secret.length == TweetNaCl.signingKeyLength) {
      Uint8List pubKey = Uint8List(TweetNaCl.publicKeyLength);
      TweetNaClPubKey.crypto_gen_pubkey(pubKey, secret.sublist(0, 32));
      developer.log(hex.encode(pubKey));
      const spkLength = TweetNaCl.signingKeyLength + TweetNaCl.publicKeyLength;
      final spk = Uint8List(spkLength);
      // Copy the secret and the pubKey into the s
      for (int i = 0; i < spkLength; i++) {
        if (i < TweetNaCl.signingKeyLength) {
          spk[i] = secret[i];
        } else {
          spk[i] = pubKey[i - TweetNaCl.signingKeyLength];
        }
      }
      return ExtendedSigningKey.fromValidBytes(
        spk,
        isExtended: true,
        keyLength: TweetNaCl.signingKeyLength + TweetNaCl.publicKeyLength,
      );
    }
    return ExtendedSigningKey.fromSeed(secret);
  }

  ExtendedSigningKey.fromValidBytes(
    Uint8List secret, {
    this.isExtended = false,
    int keyLength = TweetNaCl.signingKeyLength,
  }) : super(secret, keyLength: keyLength);

  ExtendedSigningKey.fromSeed(Uint8List seed)
      : this.fromValidBytes(_seedToSecret(seed));

  ExtendedSigningKey.generate()
      : this.fromSeed(TweetNaCl.randombytes(TweetNaCl.seedSize));

  ExtendedSigningKey.decode(String keyString, [Encoder coder = decoder])
      : this.fromValidBytes(coder.decode(keyString));

  static const decoder = Bech32Encoder(hrp: 'ed25519_sk');

  @override
  Encoder get encoder => decoder;

  static const signingKeyLength = TweetNaCl.signingKeyLength;
  static const seedSize = TweetNaCl.seedSize;

  @override
  int get prefixLength => isExtended ? signingKeyLength : seedSize;

  ByteList get seed => prefix;

  VerifyKey? _verifyKey;

  @override
  VerifyKey get verifyKey => _verifyKey ??= VerifyKey(suffix.asTypedList);

  @override
  AsymmetricPublicKey get publicKey => verifyKey;

  static Uint8List _seedToSecret(Uint8List seed) {
    if (seed.length != seedSize) {
      throw Exception('SigningKey must be created from a $seedSize byte seed');
    }

    //if (seed is Uint8List) {
    //  seed = seed.toList();
    //}

    final priv =
        Uint8List.fromList(seed + Uint8List(TweetNaCl.publicKeyLength));
    final pub = Uint8List(TweetNaCl.publicKeyLength);
    TweetNaCl.crypto_sign_keypair(pub, priv, Uint8List.fromList(seed));

    return SigningKey.fromValidBytes(priv).asTypedList;
  }

  @override
  SignedMessage sign(Uint8List message) {
    // signed message
    var sm = Uint8List(message.length + TweetNaCl.signatureLength);
    final result = TweetNaCl.crypto_sign(
      sm,
      -1,
      Uint8List.fromList(message),
      0,
      message.length,
      asTypedList,
      extended: isExtended,
    );
    if (result != 0) {
      throw Exception('Signing the massage is failed');
    }

    return SignedMessage.fromList(signedMessage: sm);
  }
}
