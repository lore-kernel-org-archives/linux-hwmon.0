Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9301F8723
	for <linux-hwmon@vger.kernel.org>; Mon, 17 Aug 2026 16:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786984943; cv=none; b=lcu1KKEAVkejo+IakEPmKCXrjON4lwPAdlmbGuvUZ+MR6I/j0zGQKfgFq7Lklu8y2CyJA8gK98yF8PVJhX1s7DwzeyHwCGxsfP2fMoiAgmBe+7rMGOAvTih/0QY9AbVCnDBDbFLmY2yY+c+Kqw4dpJlcX7nopBTdRuaT1RC4VnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786984943; c=relaxed/simple;
	bh=yhB9Q417H+KP+2F8P/OjVQZ8dNVbI42fkS4ULJiwzT0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wy8RIIcty1zP3fjM7ZV3lbGbBBZJj9DJCQos/WcL/Ad82IGzph5Er84PyfUz9u5+YESgVdShtjMbpkJ6EkqFkDFQrcPcLfXx617oBgOIWroEz284/rrsVM836FJzyml+q7VsQgERgdRAlpAG4zB85WGt+F0zhjxcb9OinIa3UOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bungeetaco.com; spf=pass smtp.mailfrom=bungeetaco.com; dkim=pass (2048-bit key) header.d=bungeetaco.com header.i=@bungeetaco.com header.b=JqRGi4AV; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bungeetaco.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bungeetaco.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bungeetaco.com header.i=@bungeetaco.com header.b="JqRGi4AV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bungeetaco.com;
	s=protonmail2; t=1786984929; x=1787244129;
	bh=jX+vxf6wCdt43S5OV3fDi4fmaWgIvn1luRvsViZVsfo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=JqRGi4AVkL2xqfJ8JHZ8vB2MiXIv+srj1dpKSdyJVXBJ88hdebTc1JY1Bb0ISIaZR
	 xTwOSYq9n/sFXGCkSe24MkCb2fd0NCaZxkPv+fs2sgHBECct/0BVFJNnSpYWn1Wm/4
	 poXN+BrWHPICP4gGnJ0m5QdodmVzLb3dTQsUgexazCvUIJ6UZ3MwZCqg7lJtlIVrrm
	 EV1bJchKdDueuCJJtAlNEi2jYQs5vYEj6uwgV12eTYrg24XvVSriLdFGCN1Tlwi0Zw
	 CZFqasUu0qGR7b+fXERTq0zscUhSFrcBlG8ABRKdjjc+DQmA4RSo017ATubxkvxS4+
	 qRkTu3/Hjg6mA==
Date: Mon, 17 Aug 2026 16:42:05 +0000
To: Guenter Roeck <linux@roeck-us.net>
From: GG <ggirouard@bungeetaco.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [BUG] hwmon: (spd5118) resume fails -ENXIO on write protected hubs
Message-ID: <vPlYOTmuxKCPw1cRvxIWJfqFl7p8endHIMWS9DZwINEUCPql8VLF7GBkmEBMokDKtHop6K5TAPUAlk-17CFWlA8extBUV7XGnuVx1KJK3iU=@bungeetaco.com>
In-Reply-To: <-r61PJXRNuWsDjnDETHSh2v7ASrtpweJe8hLjf7CbNH8-rQMiDXscPp7F_K2wLsYg0gvrl9gt7M5vyV-rPLIPSuHIKjIUr4ipRD_2jeCsmI=@bungeetaco.com>
References: <-r61PJXRNuWsDjnDETHSh2v7ASrtpweJe8hLjf7CbNH8-rQMiDXscPp7F_K2wLsYg0gvrl9gt7M5vyV-rPLIPSuHIKjIUr4ipRD_2jeCsmI=@bungeetaco.com>
Feedback-ID: 11328688:user:proton
X-Pm-Message-ID: 086415a8e0b927d0829bfc253e8dc2a17790ab27
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sorry - I should have searched the archives before sending my last email. I=
've since
found this from February, which is the same problem:

  https://lore.kernel.org/linux-hwmon/20260205102942.28745-1-tinsaetadesse2=
015@gmail.com/

And I missed the obvious clue sitting in my own boot log:

  i801_smbus 0000:00:1f.4: SPD Write Disable is set

So my kernel already knew. Apologies for the noise.

One thing I'll mention in case it's useful: that series above has spd5118 r=
efuse to
probe when writes are disabled. On my machine that would lose me two workin=
g
temperature sensors. Reads are completely fine here, I get correct temps,
and my temperature limits read back properly. It's only writing that fails.

Happy to test anything on my hardware if it would help.

Gabriel G

On Monday, August 17th, 2026 at 12:29 PM, GG <ggirouard@bungeetaco.com> wro=
te:

> Hi there,
>=20
> I apologize in advance if this isn't the right place to send this. I ran =
into
> a quirk on my own machine, went digging, and ended up working out what ca=
uses
> it, so I figured it was probably worth sharing. Please feel free to ignor=
e all
> of this if it's not useful or doesn't apply.
>=20
> Before you read any further, three things you should probably know:
>=20
>   - I'm not a programmer. I can tell you what my hardware does, and I ran
>     every test below myself on it, but if you ask me to defend the actual
>     implementation I'll be out of my depth pretty quickly.
>=20
>   - I worked this out with an AI coding assistant (Claude, claude-opus-5)=
 over
>     a long back-and-forth debugging session. It suggested things to try a=
nd
>     wrote the instrumented test modules, and I built and ran each one on =
this
>     machine and fed the results back. It drafted this write-up too, and I=
've
>     edited it.
>=20
>   - So this isn't a formal patch submission and there's deliberately no
>     Signed-off-by on it. Treat it as a bug report that happens to come wi=
th a
>     suggestion attached, and please feel free to bin the patch entirely a=
nd do
>     something completely different.
>=20
> The one thing I can offer that might actually be worth something is the
> hardware. This machine reproduces the problem every single time, so I'm h=
appy
> to test whatever you'd like, in whatever form.
>=20
> Anyway, here's what I found.
>=20
> spd5118_resume() fails with -ENXIO on every single suspend/resume cycle h=
ere,
> and I think it's because the SPD hubs on this board are write protected b=
y the
> platform firmware.
>=20
> Hardware:
>   Gigabyte Z790 AORUS PRO X, BIOS F11a
>   Intel i9-14900KS
>   2x 32GB DDR5, hubs at i2c 12-0051 and 12-0053
>   Both report: DDR5 temperature sensor: vendor 0x06:0x32 revision 1.6
>   Kernel 7.1.8 (CachyOS)
>=20
> This shows up on every resume:
>=20
>   spd5118 12-0051: Failed to write b =3D 0: -6
>   spd5118 12-0051: PM: dpm_run_callback(): spd5118_resume returns -6
>   spd5118 12-0051: PM: spd5118_resume returned -6 after 15085 usecs
>   spd5118 12-0051: PM: failed to resume async: error -6
>=20
> The sensor itself works fine either side of a suspend and the configured
> limits survive, so nothing is actually broken for me as a user. It's just=
 the
> error, plus 5-18ms of pointless failing SMBus traffic per DIMM every time=
.
>=20
> The thing that finally made it click is that this has nothing to do with
> suspend or resume at all. These hubs refuse writes all the time. Writing
> temp1_max back to the exact value it already holds, on a fully booted and=
 idle
> system, fails the same way:
>=20
>   $ cat /sys/class/hwmon/hwmon3/temp1_max
>   55000
>   $ sudo sh -c 'echo 55000 > /sys/class/hwmon/hwmon3/temp1_max'
>   sh: line 1: echo: write error: No such device or address
>=20
> Reads are completely unaffected. During resume, raw i2c_smbus_read_byte_d=
ata()
> on MR11 and on every other register succeeds on the first try and returns
> sensible values. Every single i2c_smbus_write_byte_data() comes back -ENX=
IO.
>=20
> Which means this, in spd5118_suspend():
>=20
>   regmap_update_bits(regmap, SPD5118_REG_TEMP_CONFIG, SPD5118_TS_DISABLE,
>                      SPD5118_TS_DISABLE);
>=20
> is failing silently, because its return value isn't checked. The sensor n=
ever
> actually gets disabled. But the cache still gets marked dirty, so on resu=
me
> regcache_sync() goes off to restore state that was never changed in the f=
irst
> place.
>=20
> The error message itself sent me down the wrong path for quite a while. I=
t
> doesn't come from the sync, it comes from regcache_sync()'s epilogue, whi=
ch
> force-writes every regmap range selector and then hands that write's erro=
r
> back as its own return value. For spd5118 in I2C legacy mode that selecto=
r is
> MR11, which is also a cached writeable register, and with window_start 0 =
and
> window_len 0x100 it sits inside its own paging window. That's why the mes=
sage
> singles out register 0xb, which had me convinced for ages that there was
> something specifically wrong with MR11.
>=20
> Dead ends, in case it saves anyone else the time:
>=20
>   - Dropping MR11 from the regcache before the sync does silence the "Fai=
led
>     to write b =3D 0" message, but resume still fails, because the next r=
egister
>     isn't writeable either.
>   - MR11 already reads back as 0 on resume, so there's no stale page.
>   - Reads succeed on the first attempt, so the hub isn't slow to wake up.
>   - Polling for a write to be accepted for up to 2 seconds never got one
>     through, and added 3 seconds to resume.
>   - Pinning i2c-i801 to power/control=3Don for the whole cycle changes no=
thing.
>     The adapter isn't marked suspended at that point either:
>     __i2c_check_suspended() (drivers/i2c/i2c-core.h) returns -ESHUTDOWN a=
nd
>     emits a "Transfer while suspended" dev_WARN, and neither of those sho=
ws up
>     anywhere in my logs.
>=20
> The patch below is what ended up working for me here: check whether the d=
evice
> actually accepted that suspend-time write, and if it didn't, don't bother
> marking the cache dirty or syncing on resume. With it applied, resume ret=
urns
> 0 in 0us and the error is gone. I ran 5 suspend/resume cycles on a fresh =
boot
> with no debug kernel options, and /sys/kernel/debug/suspend_stats went fr=
om
> success=3D0 failed_resume=3D0 to success=3D5 failed_resume=3D0, with temp=
eratures and
> limits unaffected throughout.
>=20
> One thing I can't check myself: I don't have any hardware with a hub that=
 does
> accept writes, so I can't confirm the normal path still behaves properly =
on a
> machine like that.
>=20
> Candidate change against drivers/hwmon/spd5118.c:
>=20
> --- a/drivers/hwmon/spd5118.c
> +++ b/drivers/hwmon/spd5118.c
> @@ -79,6 +79,7 @@ struct spd5118_data {
>  =09struct regmap *regmap;
>  =09struct mutex nvmem_lock;
>  =09bool is_16bit;
> +=09bool suspend_wp;=09/* device NAKed the suspend write: nothing to rest=
ore */
>  };
>=20
> @@ -498,10 +499,27 @@ static int spd5118_suspend(struct device *dev)
>  =09=09return err;
>=20
>  =09regcache_cache_bypass(regmap, true);
> -=09regmap_update_bits(regmap, SPD5118_REG_TEMP_CONFIG, SPD5118_TS_DISABL=
E,
> -=09=09=09   SPD5118_TS_DISABLE);
> +=09err =3D regmap_update_bits(regmap, SPD5118_REG_TEMP_CONFIG,
> +=09=09=09=09 SPD5118_TS_DISABLE, SPD5118_TS_DISABLE);
>  =09regcache_cache_bypass(regmap, false);
>=20
> +=09/*
> +=09 * Platform firmware may write protect the SPD hub after memory
> +=09 * training, in which case the device serves reads but NAKs every wri=
te
> +=09 * with -ENXIO. The temperature sensor was then never disabled, so
> +=09 * there is no device state to restore on resume.
> +=09 */
> +=09data->suspend_wp =3D err < 0;
> +=09if (data->suspend_wp) {
> +=09=09dev_dbg(dev, "write protected, skipping state save (%d)\n", err);
> +=09=09/* Still avoid bus traffic while suspended. */
> +=09=09regcache_cache_only(regmap, true);
> +=09=09return 0;
> +=09}
> +
>  =09regcache_cache_only(regmap, true);
>  =09regcache_mark_dirty(regmap);
>=20
> @@ -514,6 +532,10 @@ static int spd5118_resume(struct device *dev)
>  =09struct regmap *regmap =3D data->regmap;
>=20
>  =09regcache_cache_only(regmap, false);
> +
> +=09if (data->suspend_wp)
> +=09=09return 0;
> +
>  =09return regcache_sync(regmap);
>  }
>=20
> As far as I can tell this goes back to d1b4c755081a ("hwmon: (spd5118) Ad=
d
> suspend/resume support"), which first shipped in v6.11.
>=20
> Thanks for taking a look, and no worries at all if this isn't useful.
>=20
> Gabriel G
