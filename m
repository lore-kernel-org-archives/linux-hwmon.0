Received: from mail-4397.protonmail.ch (mail-4397.protonmail.ch [185.70.43.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36325450909
	for <linux-hwmon@vger.kernel.org>; Mon, 17 Aug 2026 16:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786984158; cv=none; b=IRNM0sWGCcY4kEVM5nEYeU5cwAgmkQqM1Si+C74AHPABbnAIYV1YtJkYdbgi+1z8B/H56j73C4ID+HXYZGoXT6hw1p4pytb2oKOjXYzmiI6Mbc8Vfpiicd6iNG8j/CoxyTIAP5c989U9m426RDhCdVxvTZ18Dn3tO86O/T74JJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786984158; c=relaxed/simple;
	bh=i1t9xAFwWc2cnkv//bJNrxFxCMsKUpQWYQhWViLwueI=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Bht5AV3RCqryipkpL68BlEG08/KLnclL8ka5409bzTUJMWUPyoY/i9Nu3RYsz06T+s2dzbHfnsYgN8Y8hGl5CCf7OlZD6A0J8kGxg2RitlVhbINMHZsUTAp8cQ280lOcMT5Ec+lXQS9mWKBH2qCTa7y6unW3Q5mlVWVyC0yzz/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bungeetaco.com; spf=pass smtp.mailfrom=bungeetaco.com; dkim=pass (2048-bit key) header.d=bungeetaco.com header.i=@bungeetaco.com header.b=tT0BDlYL; arc=none smtp.client-ip=185.70.43.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bungeetaco.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bungeetaco.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bungeetaco.com header.i=@bungeetaco.com header.b="tT0BDlYL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bungeetaco.com;
	s=protonmail2; t=1786984152; x=1787243352;
	bh=LUBlx93nSg3eC2NVANpd+dvS1Ts8C6RHd21tKVLhuS0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=tT0BDlYLWcc06titawdLYbCnCxeyIFkJ/M63bjjO6/hQYycOf1PvEOWVH77GiVuXm
	 jhY5B3XIhWBQgxwynbfG3YV6b+Junf25iQ7GyE7QZMn9yOka5kaOmeF8owntH4ppRs
	 yneMizN2HuOYwJ/NRFT4AUNOm4HJ6MsLrubCpTjnA2wpk0DVSj3t2tWvZtJtusannH
	 zHL6GsovYGSUI9piCLBMzGIwIBFZRJ2TJIiJYl+QVelGn0H84CahGKLhkKT7QCsdDH
	 SBeVD8anO74TIn80q7RAh3vf6m3b+i9GjzYjp7IHZQFGqHBeF7zS7S0tkEwrNp51SS
	 uQQh5V02M0diQ==
Date: Mon, 17 Aug 2026 16:29:08 +0000
To: Guenter Roeck <linux@roeck-us.net>
From: GG <ggirouard@bungeetaco.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [BUG] hwmon: (spd5118) resume fails -ENXIO on write protected hubs
Message-ID: <-r61PJXRNuWsDjnDETHSh2v7ASrtpweJe8hLjf7CbNH8-rQMiDXscPp7F_K2wLsYg0gvrl9gt7M5vyV-rPLIPSuHIKjIUr4ipRD_2jeCsmI=@bungeetaco.com>
Feedback-ID: 11328688:user:proton
X-Pm-Message-ID: 7a244a7659edf7b1c4dc77e380505b342faaf01b
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi there,

I apologize in advance if this isn't the right place to send this. I ran in=
to
a quirk on my own machine, went digging, and ended up working out what caus=
es
it, so I figured it was probably worth sharing. Please feel free to ignore =
all
of this if it's not useful or doesn't apply.

Before you read any further, three things you should probably know:

  - I'm not a programmer. I can tell you what my hardware does, and I ran
    every test below myself on it, but if you ask me to defend the actual
    implementation I'll be out of my depth pretty quickly.

  - I worked this out with an AI coding assistant (Claude, claude-opus-5) o=
ver
    a long back-and-forth debugging session. It suggested things to try and
    wrote the instrumented test modules, and I built and ran each one on th=
is
    machine and fed the results back. It drafted this write-up too, and I'v=
e
    edited it.

  - So this isn't a formal patch submission and there's deliberately no
    Signed-off-by on it. Treat it as a bug report that happens to come with=
 a
    suggestion attached, and please feel free to bin the patch entirely and=
 do
    something completely different.

The one thing I can offer that might actually be worth something is the
hardware. This machine reproduces the problem every single time, so I'm hap=
py
to test whatever you'd like, in whatever form.

Anyway, here's what I found.

spd5118_resume() fails with -ENXIO on every single suspend/resume cycle her=
e,
and I think it's because the SPD hubs on this board are write protected by =
the
platform firmware.

Hardware:
  Gigabyte Z790 AORUS PRO X, BIOS F11a
  Intel i9-14900KS
  2x 32GB DDR5, hubs at i2c 12-0051 and 12-0053
  Both report: DDR5 temperature sensor: vendor 0x06:0x32 revision 1.6
  Kernel 7.1.8 (CachyOS)

This shows up on every resume:

  spd5118 12-0051: Failed to write b =3D 0: -6
  spd5118 12-0051: PM: dpm_run_callback(): spd5118_resume returns -6
  spd5118 12-0051: PM: spd5118_resume returned -6 after 15085 usecs
  spd5118 12-0051: PM: failed to resume async: error -6

The sensor itself works fine either side of a suspend and the configured
limits survive, so nothing is actually broken for me as a user. It's just t=
he
error, plus 5-18ms of pointless failing SMBus traffic per DIMM every time.

The thing that finally made it click is that this has nothing to do with
suspend or resume at all. These hubs refuse writes all the time. Writing
temp1_max back to the exact value it already holds, on a fully booted and i=
dle
system, fails the same way:

  $ cat /sys/class/hwmon/hwmon3/temp1_max
  55000
  $ sudo sh -c 'echo 55000 > /sys/class/hwmon/hwmon3/temp1_max'
  sh: line 1: echo: write error: No such device or address

Reads are completely unaffected. During resume, raw i2c_smbus_read_byte_dat=
a()
on MR11 and on every other register succeeds on the first try and returns
sensible values. Every single i2c_smbus_write_byte_data() comes back -ENXIO=
.

Which means this, in spd5118_suspend():

  regmap_update_bits(regmap, SPD5118_REG_TEMP_CONFIG, SPD5118_TS_DISABLE,
                     SPD5118_TS_DISABLE);

is failing silently, because its return value isn't checked. The sensor nev=
er
actually gets disabled. But the cache still gets marked dirty, so on resume
regcache_sync() goes off to restore state that was never changed in the fir=
st
place.

The error message itself sent me down the wrong path for quite a while. It
doesn't come from the sync, it comes from regcache_sync()'s epilogue, which
force-writes every regmap range selector and then hands that write's error
back as its own return value. For spd5118 in I2C legacy mode that selector =
is
MR11, which is also a cached writeable register, and with window_start 0 an=
d
window_len 0x100 it sits inside its own paging window. That's why the messa=
ge
singles out register 0xb, which had me convinced for ages that there was
something specifically wrong with MR11.

Dead ends, in case it saves anyone else the time:

  - Dropping MR11 from the regcache before the sync does silence the "Faile=
d
    to write b =3D 0" message, but resume still fails, because the next reg=
ister
    isn't writeable either.
  - MR11 already reads back as 0 on resume, so there's no stale page.
  - Reads succeed on the first attempt, so the hub isn't slow to wake up.
  - Polling for a write to be accepted for up to 2 seconds never got one
    through, and added 3 seconds to resume.
  - Pinning i2c-i801 to power/control=3Don for the whole cycle changes noth=
ing.
    The adapter isn't marked suspended at that point either:
    __i2c_check_suspended() (drivers/i2c/i2c-core.h) returns -ESHUTDOWN and
    emits a "Transfer while suspended" dev_WARN, and neither of those shows=
 up
    anywhere in my logs.

The patch below is what ended up working for me here: check whether the dev=
ice
actually accepted that suspend-time write, and if it didn't, don't bother
marking the cache dirty or syncing on resume. With it applied, resume retur=
ns
0 in 0us and the error is gone. I ran 5 suspend/resume cycles on a fresh bo=
ot
with no debug kernel options, and /sys/kernel/debug/suspend_stats went from
success=3D0 failed_resume=3D0 to success=3D5 failed_resume=3D0, with temper=
atures and
limits unaffected throughout.

One thing I can't check myself: I don't have any hardware with a hub that d=
oes
accept writes, so I can't confirm the normal path still behaves properly on=
 a
machine like that.

Candidate change against drivers/hwmon/spd5118.c:

--- a/drivers/hwmon/spd5118.c
+++ b/drivers/hwmon/spd5118.c
@@ -79,6 +79,7 @@ struct spd5118_data {
 =09struct regmap *regmap;
 =09struct mutex nvmem_lock;
 =09bool is_16bit;
+=09bool suspend_wp;=09/* device NAKed the suspend write: nothing to restor=
e */
 };

@@ -498,10 +499,27 @@ static int spd5118_suspend(struct device *dev)
 =09=09return err;

 =09regcache_cache_bypass(regmap, true);
-=09regmap_update_bits(regmap, SPD5118_REG_TEMP_CONFIG, SPD5118_TS_DISABLE,
-=09=09=09   SPD5118_TS_DISABLE);
+=09err =3D regmap_update_bits(regmap, SPD5118_REG_TEMP_CONFIG,
+=09=09=09=09 SPD5118_TS_DISABLE, SPD5118_TS_DISABLE);
 =09regcache_cache_bypass(regmap, false);

+=09/*
+=09 * Platform firmware may write protect the SPD hub after memory
+=09 * training, in which case the device serves reads but NAKs every write
+=09 * with -ENXIO. The temperature sensor was then never disabled, so
+=09 * there is no device state to restore on resume.
+=09 */
+=09data->suspend_wp =3D err < 0;
+=09if (data->suspend_wp) {
+=09=09dev_dbg(dev, "write protected, skipping state save (%d)\n", err);
+=09=09/* Still avoid bus traffic while suspended. */
+=09=09regcache_cache_only(regmap, true);
+=09=09return 0;
+=09}
+
 =09regcache_cache_only(regmap, true);
 =09regcache_mark_dirty(regmap);

@@ -514,6 +532,10 @@ static int spd5118_resume(struct device *dev)
 =09struct regmap *regmap =3D data->regmap;

 =09regcache_cache_only(regmap, false);
+
+=09if (data->suspend_wp)
+=09=09return 0;
+
 =09return regcache_sync(regmap);
 }

As far as I can tell this goes back to d1b4c755081a ("hwmon: (spd5118) Add
suspend/resume support"), which first shipped in v6.11.

Thanks for taking a look, and no worries at all if this isn't useful.

Gabriel G
