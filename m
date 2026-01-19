Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBDC2DB78A;
	Mon, 19 Jan 2026 19:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768852702; cv=none; b=B4YOJUKLKjlfcteJlkGmBrwvddh5wUqc/sFn/dHTiE8OMDm8GtXt3zSPCdDdjPwLlFMAvaO/BLfnDPq4XGC9ysZK4thoKtU19wiIlZAw3KczJdS4L+yDzEoWbUz+9SbimTIc9DuRFaYfpe+LIW4g0Ulv6VXFP2rQ2nHWqLS4T5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768852702; c=relaxed/simple;
	bh=msICSwtkxpkghstHJnXI71pc2NlWIhXHO2yjL8eJVPc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MLC7gRgzuzygRQybir2t4qUjC61hyxYsD6W/d31feMj3sy8MEeKWno/abWmHxWiTMInN0h/Vx54HPAqZlaHlaNn+/WIUh7vjfLwPjn51LeaLWT5ujs0no3eoVoX0WvwH/8IWXck+JV9dxLmHlC34t1exUoifdukhtzc5cAmR0ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=silS1VYT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="silS1VYT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02A7FC19422;
	Mon, 19 Jan 2026 19:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768852701;
	bh=msICSwtkxpkghstHJnXI71pc2NlWIhXHO2yjL8eJVPc=;
	h=Date:From:To:Cc:Subject:From;
	b=silS1VYTSbexTEzhnllUdLn+2XjGAWCCUwTMEwr5mWOBZll/R8Try/hpPyUIAhsFZ
	 85EEkD8ZHsfuLrUugM/5QF11d+gOFxIW+kzFq2ccdO7FZ5LBbA9TbNFSw0lKVPWbrv
	 s/P2A2b2bj4oEWKFvsti3yws4btkUB0IN7/lM5zHPtoTyysJEJcwZ3eRw3hozjLLzf
	 /e1x0yURLUt8W8ifupinURhCSjuvAfCOUwjA3gJP2XGu1MdBEG0x4rUDI8S8yJDkCz
	 b3sXoi/k3VoRa4spYh5mZ/Lt5CDqeiTaO8jSFUe55KeeZwiGwqE1cm5ZjHi4pV2yKC
	 rh45TFi6LEw1w==
Date: Mon, 19 Jan 2026 12:58:17 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Guenter Roeck <linux@roeck-us.net>
Cc: asahi@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, Justin Stitt <justinstitt@google.com>,
	Neal Gompa <neal@gompa.dev>
Subject: FIELD_PREP failure in drivers/hwmon/macsmc-hwmon.c
Message-ID: <20260119195817.GA1035354@ax162>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi folks,

There is a build error from a FIELD_PREP in drivers/hwmon/macsmc-hwmon.c
when building with clang-17 and older:

  drivers/hwmon/macsmc-hwmon.c:249:10: error: call to '__compiletime_assert_814' declared with 'error' attribute: FIELD_PREP: value too large for the field
    249 |                        FIELD_PREP(FLT_MANT_MASK, val);
        |                        ^
  include/linux/bitfield.h:137:3: note: expanded from macro 'FIELD_PREP'
    137 |                 __FIELD_PREP(_mask, _val, "FIELD_PREP: ");              \
        |                 ^
  include/linux/bitfield.h:90:3: note: expanded from macro '__FIELD_PREP'
     90 |                 __BF_FIELD_CHECK_MASK(mask, val, pfx);                  \
        |                 ^
  include/linux/bitfield.h:69:3: note: expanded from macro '__BF_FIELD_CHECK_MASK'
     69 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
        |                 ^
  note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
  include/linux/compiler_types.h:619:2: note: expanded from macro '_compiletime_assert'
    619 |         __compiletime_assert(condition, msg, prefix, suffix)
        |         ^
  include/linux/compiler_types.h:612:4: note: expanded from macro '__compiletime_assert'
    612 |                         prefix ## suffix();                             \
        |                         ^
  <scratch space>:18:1: note: expanded from here
     18 | __compiletime_assert_814
        | ^

This does not appear to be strictly clang related, as this can be
reproduced with GCC if macsmc_hwmon_write_f32() and
macsmc_hwmon_write_key() are marked as __always_inline (after an
internal change in LLVM, these functions are not inlined anymore):

===
diff --git a/drivers/hwmon/macsmc-hwmon.c b/drivers/hwmon/macsmc-hwmon.c
index 1c0bbec7e8eb..e66d6ee30d7f 100644
--- a/drivers/hwmon/macsmc-hwmon.c
+++ b/drivers/hwmon/macsmc-hwmon.c
@@ -224,7 +224,7 @@ static int macsmc_hwmon_read_key(struct apple_smc *smc,
        return 0;
 }

-static int macsmc_hwmon_write_f32(struct apple_smc *smc, smc_key key, int value)
+static __always_inline int macsmc_hwmon_write_f32(struct apple_smc *smc, smc_key key, int value)
 {
        u64 val;
        u32 fval = 0;
@@ -252,7 +252,7 @@ static int macsmc_hwmon_write_f32(struct apple_smc *smc, smc_key key, int value)
        return apple_smc_write_u32(smc, key, fval);
 }

-static int macsmc_hwmon_write_key(struct apple_smc *smc,
+static __always_inline int macsmc_hwmon_write_key(struct apple_smc *smc,
                                  struct macsmc_hwmon_sensor *sensor, long val)
 {
        switch (sensor->info.type_code) {
===

  In file included from <command-line>:
  In function 'macsmc_hwmon_write_f32',
      inlined from 'macsmc_hwmon_write_key' at drivers/hwmon/macsmc-hwmon.c:261:10,
      inlined from 'macsmc_hwmon_write_fan.isra' at drivers/hwmon/macsmc-hwmon.c:317:10:
  include/linux/compiler_types.h:631:45: error: call to '__compiletime_assert_814' declared with attribute error: FIELD_PREP: value too large for the field
    631 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
        |                                             ^
  include/linux/compiler_types.h:612:25: note: in definition of macro '__compiletime_assert'
    612 |                         prefix ## suffix();                             \
        |                         ^~~~~~
  include/linux/compiler_types.h:631:9: note: in expansion of macro '_compiletime_assert'
    631 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
        |         ^~~~~~~~~~~~~~~~~~~
  include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
     39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
        |                                     ^~~~~~~~~~~~~~~~~~
  include/linux/bitfield.h:69:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     69 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
        |                 ^~~~~~~~~~~~~~~~
  include/linux/bitfield.h:90:17: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
     90 |                 __BF_FIELD_CHECK_MASK(mask, val, pfx);                  \
        |                 ^~~~~~~~~~~~~~~~~~~~~
  include/linux/bitfield.h:137:17: note: in expansion of macro '__FIELD_PREP'
    137 |                 __FIELD_PREP(_mask, _val, "FIELD_PREP: ");              \
        |                 ^~~~~~~~~~~~
  drivers/hwmon/macsmc-hwmon.c:249:24: note: in expansion of macro 'FIELD_PREP'
    249 |                        FIELD_PREP(FLT_MANT_MASK, val);
        |                        ^~~~~~~~~~

Justin did a little digging and saw that through

  macsmc_hwmon_write_fan()
  -> macsmc_hwmon_write_key()
    -> macsmc_hwmon_write_f32()

value is 1 so:

static __always_inline int macsmc_hwmon_write_f32(struct apple_smc *smc, smc_key key, int value)
{
        u64 val;
        u32 fval = 0;
        int exp = 0, neg;

        val = abs(value); // val == 1
        neg = val != value;

        if (val) {
                int msb = __fls(val) - exp; // __fls(1) == 0, thus msb == 0

                if (msb > 23) {
                        val >>= msb - FLT_MANT_BIAS;
                        exp -= msb - FLT_MANT_BIAS;
                } else if (msb < 23) {
                        val <<= FLT_MANT_BIAS - msb; // val = (1 << 23) == 0x800000
                        exp += msb;
                }

                fval = FIELD_PREP(FLT_SIGN_MASK, neg) |
                       FIELD_PREP(FLT_EXP_MASK, exp + FLT_EXP_BIAS) |
                       // Fails __BF_FIELD_CHECK_MASK as
                       //
                       // __builtin_ffsll(0x7FFFFF) - 1) == 0
                       //
                       // ~(0x7FFFFF >> 0) & (0x800000) == 0x800000
                       FIELD_PREP(FLT_MANT_MASK, val);
        }

        return apple_smc_write_u32(smc, key, fval);
}

It seems like msb of zero is unexpected in this path but I am not sure
what the fix is, hence the report.

Cheers,
Nathan
