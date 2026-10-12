Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7CA4AC152
	for <linux-hwmon@vger.kernel.org>; Mon, 12 Oct 2026 19:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791833665; cv=pass; b=aPGYYKw3MeCI2fk1c/DcFoIzFdCwTVBA1iQdhQfWYNrrPg9Dpe/nwHG4ZDoJqCpoTUA1SmBWEqTnujKm2W97bvR1w86MDcctXU3uVN/9xjrIEAiW7qMWH9uO/4zM3y0Vi3Vv+dXm7gz/1yz9L3Pds3f/q2co2ZmfkSyRwZC3CaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791833665; c=relaxed/simple;
	bh=BK90vSA3QoQY5cbEAXTsWUGjvJUhb72aPaTgSCPSwlg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YsAZXY4XR9cJsrt87SdbZtj0ZC0VAD8vbgl9EwbabsICy/ZnlRdnWIrJvN3U3AUsNs/stZ61u58LNaQ/1UHFKVEB9GOYnUwxjc+Qz0Oq+7VM8l32+2I5O3zGacFRoid44j8Ss0l/R5zqzjM6kKBLAx0mx+TpTlYugq2ZOTHtzww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bubiXXEI; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bubiXXEI"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a65120bf25so3889061fa.3
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Oct 2026 12:34:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791833661; cv=none;
        d=google.com; s=arc-20260327;
        b=AXX6PUUU2lDgjYYLkvHBnwY/CkegXKM8zoEuOHJM5DJ8z2DvVDXwrYz2m/YsTV1euC
         5WdUpb/UqEhVSraDGjQWRNddDIhqfDWfHV1k5bxrLFQLjc8gtd/0p4hVI0jwsWhvTXDF
         4vr5t2RaWwSpH613JHwlmNc7+En3jCe/vqNBKHR9LyKEq/gFriIGIRbPI9P4JVTyiWSs
         zU2qOEoMy0Fowp0OU2vLu53Y/eM1DkEHrUvYAwc2K9IR/B+3eALcZ7PlGZYnVb86aTO0
         rZs6UonV8IFSyR0aiALa19N/tZJFXG7TT/ZZsH9CeU8KqlGkx99SL8m6TwWgBYEmSHxE
         fHag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9Y4WYaisFauvdhTru1K85uOadNWxqEHIJLaeUHvJIRQ=;
        fh=EGArXqObEDZsGGXBBbtIlmFTjFTWAQ9IrapJU5Br328=;
        b=NnP2reB2uvVjP+X+qRje0yyjFNhquXiJuRUu8d5CTbo54Jzzb1UzbMu+9vGeR+DTK/
         mPsJjonkOwq28AxCJyVxjW2wLa6k1ljn8hQwe8IwFAYAEeFN4+ChsXaAZMWHvwyCDYXs
         zXwhhWt6k7eamnpv/SQUx7C88B3ZUFWMLpbc4Q9Lt7RzsgypcmqL9DeLMQ+F1MHXnLlE
         LCX0NONgDme/YgDQIKSyNIzLQtki7AAXKyuaP5moRKXwGPUDKu/1I0BL+OIb+pMYLS8s
         q1R0PYpMZFgiwTKuAFWroK7O8Yk+KdKvFEnUaXVD14Vl3B1EkyKnPUwBWrOkai/H9gac
         BmJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791833661; x=1792438461; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Y4WYaisFauvdhTru1K85uOadNWxqEHIJLaeUHvJIRQ=;
        b=bubiXXEIRLAuvaCqoeC3p7urLfwCpb063MO4SdCU/3jKIiwhwCtHNwY9bM1WzTc8RP
         BiwYFVy8uhgZDugKIfp6N+Ezs+vX9JOzPk9CirnS+NJP6FAD09emXuvOpWL5sKM2cJQL
         RRAkIjQGim4YUTUndNFGtJLmF+GS4R2WXRyaeGJs8JiIeDStgSGIr7Ir0JuK/FkSTM4v
         Y/mCe+nL5oYmuKg5/yDj8jeSX7SK90a3vQWqfo84cNRekkDKyHA9u/qVkAfBv+3qvYDd
         YpRCk9OLlIBfNr65epIrOU+slq2H9hVgnflJCNDi+smM9xl/4sMzdmS/ckcXkTWrBypg
         9n4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791833661; x=1792438461;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9Y4WYaisFauvdhTru1K85uOadNWxqEHIJLaeUHvJIRQ=;
        b=VNDv08qTeX3k6MBsy9+wPuFg1kTxSG1aeV4bpdlhNSGz+7Oesq0jq2IPJ+owuYS2fs
         1vcnmjOxAGXMMgwLIxk+6DsoTDBAWXsJ2QtrfYJGMRr9zEd+mRdgBCGF/nFa3gfrXFZ7
         840Ex601ExfljYIPtrUuKrK3JY6nkAlrFtEBCXdMLMTxHJIqy+nDc+aydHkSDsJk7rzu
         UK+Hxr1qxouUBLUs/J8KGufXYKZHYoor7hHKEt5B2k8U9cMxmVFe25NYLOjR2XDBjnrt
         HHu9AYs0L0AB5KnnQ6P9TxhXIPgu7nL/EZdUK69O98qlnMQJ7Zux7sH16TQ/Le3YSzTk
         PNcQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7MdEZrHkFQr3e/DS1vP9FsnsL3zeCUh6WQap08X5pnL8sktVvrtZjNM6TBlUvQR5HRUsh0ItSEcgM5g==@vger.kernel.org
X-Gm-Message-State: AFq9FYIIRVl95ps/XgHPlXxuatQ/vJK1xTPQ2qjGcbuhu3dSbchetMoC
	XKFl4h2p2ZAMmtZ5/WhhLsjbYIs70Byi3T4vqp3932jGjHdf50eqcnTKJTdjbSMv0VxIGiA0+Mg
	Tpzc3yj/+2jdEh9z7+q5cjluPtcAE6gg=
X-Gm-Gg: AYBFou3M/MVtXfAAGmNW9Crami+D4bfmrrMt+Ii8hHeJneQLk2qL+IIrtBXFkKncB+k
	Uk0XBr1TyKVWp5K7J9PIJ/+9E/TPnSgt55A9e2sf5Ruys/SZJbwn8+Skgh6dPWZRBs8FaYP07Oj
	/G7Gs9d14u3w3twCyHr1WJTOCVCZyKNF8XtcSB4zrFUeWcJ7dlpTgNvq7EXu2dFW7woBonhdzNI
	QHyC2qY54uyFM8LSTdeP0mlq38LTdFn42FDBeUsHFN1szpC871Sk817cjoZ/5ekDuHWSe2X1H6o
	XvmLJfFW4MZWXdFjho4uRNPbHB2EAKlX6Xn5AkW2mfrIN4w4CZFc2mgSIN/5HsacBUtR/3Wn4qR
	njIDW8fD2IwKA
X-Received: by 2002:a2e:a10e:0:b0:3a7:7ce9:7530 with SMTP id
 38308e7fff4ca-3a9c53505bcmr20544211fa.2.1791833660578; Mon, 12 Oct 2026
 12:34:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPvUaSo1D+1Tvk3-4TMiXw-ScBtY8Mu0FzO7R_EG6zrjYfjYqg@mail.gmail.com>
 <asxTYBiGy6lf6-Ki@archlinux> <CAPvUaSo-ubCOCYYPadY1C23y1Fd_AAhQLuVKWRa6F1XVh6mk_Q@mail.gmail.com>
 <asz7WqGzukhkYHGD@archlinux> <CAPvUaSrbWrBuvAi3R02xC8w8M5Yh97pVd3-+FBXLp3mPgG5cUQ@mail.gmail.com>
 <as0bOFOoaaw-smyB@archlinux>
In-Reply-To: <as0bOFOoaaw-smyB@archlinux>
From: Lorenzo Collevecchio <lorenzocollevecchio17@gmail.com>
Date: Mon, 12 Oct 2026 21:34:07 +0200
X-Gm-Features: AclHuK9gwhlBAzOTdnpC_DKY74oNreZZ1z9ydlMApMHSbMiUysB2biOQPudp18Q
Message-ID: <CAPvUaSoBgAG=MX93vMhfEiEk5bYXGydFsGn8CpoCu_QVQRPTCQ@mail.gmail.com>
Subject: Re: hp-wmi: WHCM AE_AML_OPERAND_TYPE and fan init -22 on HP OmniBook
 5 16-ag1xxx (board 8DF4)
To: Krishna Chomal <krishna.chomal108@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, W_Armin@gmx.de
Content-Type: text/plain; charset="UTF-8"

Subject: Re: hp-wmi: WHCM AE_AML_OPERAND_TYPE and fan init -22 on HP
OmniBook 5 16-ag1xxx (board 8DF4)

Hi Krishna,

No problem, thanks for the revised patch.

Base: stable v7.2.9 (drivers/platform/x86/hp/hp-wmi.c), built out of
tree against 7.2.9-2-cachyos. I applied your three hunks by hand,
because the context in my tree differs (my hp_wmi_hwmon_is_visible()
uses is_victus_s_thermal_profile()). The resulting hp_wmi_hwmon_init()
has the same structure as your diff: hwmon registration first, then
fan_count with the pr_info, then the early return before
hp_wmi_setup_fan_settings().

Test: normal boot (hp_bioscfg loaded), rmmod hp_wmi, insmod the
patched module. dmesg after the reload:

[  318.615352] hp_wmi: loading out-of-tree module taints kernel.
[  319.235086] input: HP WMI hotkeys as /devices/virtual/input/input27
[  319.646490] ACPI Error: Aborting method \_SB.WMID.WHCM due to
previous error (AE_AML_OPERAND_TYPE)
[  319.646528] hp_wmi: channel = 0 | fan_speed = -22
[  319.851354] ACPI Error: Aborting method \_SB.WMID.WHCM due to
previous error (AE_AML_OPERAND_TYPE)
[  319.851395] hp_wmi: channel = 1 | fan_speed = -22
[  320.056884] ACPI Error: Aborting method \_SB.WMID.WHCM due to
previous error (AE_AML_OPERAND_TYPE)
[  320.262561] ACPI Error: Aborting method \_SB.WMID.WHCM due to
previous error (AE_AML_OPERAND_TYPE)
[  320.466854] ACPI Error: Aborting method \_SB.WMID.WHCM due to
previous error (AE_AML_OPERAND_TYPE)
[  320.466894] hp_wmi: fan_count = -22
[  320.878745] hp_wmi: Registered as platform profile handler

hwmon folder: contains only device, name, power, subsystem, uevent. No
pwm1_enable, and no fan*_input.

So:
  - The hwmon device is registered and pwm1_enable is hidden, as you expected.
  - "Failed to apply initial fan settings: -22" is no longer printed.
  - fan1_input/fan2_input are not visible because
hp_wmi_get_fan_speed() returns -22 for both channels, not 0. Each of
these queries (fan speed per channel, and fan count) ends in a WHCM
abort with AE_AML_OPERAND_TYPE, so no result buffer is returned at
all, rather than a stub all-zero one.
  - fan_count is also -22, which is why the early return is taken.

I wonder whether the AML error depends on what the driver passes in:
the error says Index() found an Integer where it needs a
Buffer/String/Package. Does it look to you as if WHCM expects a
different argument layout than the driver sends for these queries? I
can test any variant.

Happy to test further patches.

Thanks,
Lorenzo

Il giorno lun 12 ott 2026 alle ore 19:49 Krishna Chomal
<krishna.chomal108@gmail.com> ha scritto:
>
> On Mon, Oct 12, 2026 at 06:04:37PM +0200, Lorenzo Collevecchio wrote:
> >Subject: Re: hp-wmi: WHCM AE_AML_OPERAND_TYPE and fan init -22 on HP
> >OmniBook 5 16-ag1xxx (board 8DF4)
> >
> >Hi Krishna,
> >
> >Thanks for the patch. Results below.
> >
> >Base and adaptation:
> >I used drivers/platform/x86/hp/hp-wmi.c from stable v7.2.9, built out
> >of tree against 7.2.9-2-cachyos. Your diff did not apply cleanly: hunk
> >1 failed, because my hp_wmi_hwmon_is_visible() uses
> >is_victus_s_thermal_profile() and hp_wmi_get_fan_speed_victus_s()
> >rather than the helpers in your context lines. Hunks 2 and 3 applied
> >with offsets of about -230 lines. So I made these changes by hand:
> >  - declared int fan_speed in hp_wmi_hwmon_is_visible()
> >  - added your pr_info() and the fan_speed variable in the non-Victus
> >hwmon_fan branch
> >  - added the fan_count <= 0 early return in hp_wmi_hwmon_init()
> >I did NOT add the hwmon_pwm_enable check in is_visible(), since the
> >early return in init already prevents hwmon registration. If you want
> >me to test against a different tree, tell me which one.
> >
> >Test: normal boot (hp_bioscfg not blacklisted), then rmmod hp_wmi and
> >insmod the patched module. Output of dmesg | grep -i -E
> >"hp.wmi|WHCM|WQB|fan", showing the stock boot first and then the
> >reload at about 5156 s:
> >
> >[    6.453093] ACPI Error: Aborting method \_SB.WMID.WHCM ...
> >(AE_AML_OPERAND_TYPE)
> >[    6.655089] ACPI Error: Aborting method \_SB.WMID.WHCM ...
> >(AE_AML_OPERAND_TYPE)
> >[    6.857553] ACPI Error: Aborting method \_SB.WMID.WHCM ...
> >(AE_AML_OPERAND_TYPE)
> >[    6.857581] hp-wmi hp-wmi: Failed to apply initial fan settings: -22
> >[    7.262812] hp_wmi: Registered as platform profile handler
> >[    7.308567] ACPI Error: Aborting method \_SB.WMID.WQBC ...
> >(AE_AML_OPERAND_VALUE)
> >[    7.309182] ACPI Error: Aborting method \_SB.WMID.WQBE ...
> >(AE_AML_OPERAND_VALUE)
> >[ 5156.582212] hp_wmi: loading out-of-tree module taints kernel.
> >[ 5156.582224] hp_wmi: module verification failed: signature and/or
> >required key missing - tainting kernel
> >[ 5157.203181] input: HP WMI hotkeys as /devices/virtual/input/input27
> >[ 5157.614765] ACPI Error: Aborting method \_SB.WMID.WHCM ...
> >(AE_AML_OPERAND_TYPE)
> >[ 5158.026462] hp_wmi: Registered as platform profile handler
> >
> >What I see with the patched module:
> >  - "Failed to apply initial fan settings: -22" is gone.
> >  - /sys/devices/platform/hp-wmi/hwmon/ does not exist any more, so
> >pwm1_enable is hidden as you expected.
> >  - Only one WHCM error is logged after the reload instead of three. I
> >do not know which call produces it; I am guessing it is the fan count
> >query.
> >  - No "channel = ... | fan_speed = ..." lines appear, because no
> >hwmon device is registered once fan_count <= 0, so is_visible() never
> >runs. If you want to see the fan speed query result, the print would
> >have to go somewhere that runs in this case. I can test a modified
> >patch.
> >  - WQBC/WQBE do not appear in the reload because only hp_wmi was
> >reloaded (hp_bioscfg stayed loaded).
> >  - The platform profile still registers with quiet balanced performance.
> >
> >Fan Always On in the BIOS was off during all my tests.
> >
> >Fan behaviour, in case it is useful: on a cold boot with a 2-core
> >stress-ng load, the CPU went from 46 C to 80 C in about 18 seconds
> >while acpi_fan fan1_input stayed at 0 RPM (Fan Always On off). I
> >stopped the test at 80 C. I can send the full log, and I can retest
> >with Fan Always On enabled if you want.
> >
> >Happy to test further patches.
>
> My fault, sorry. I should have clarified earlier that my patch was
> based off of pdx86 tree[1] (master branch). Regarding the patch yes,
> by mistake I ended up disabling the whole hwmon device (not what we
> want). Let's register the hwmon device first then later handle the fan
> logic optionally with the count guards.
>
> Now hwmon should be available but pwm1_enable will be hidden. Also,
> fan{1,2}_input is expected to be visible, I am not sure why it isn't
> showing up for your device.
>
> (as usual, rest all errors would be same)
>
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index b2773fc1aca4..422d65d5c514 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -2679,8 +2679,14 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
>                                        enum hwmon_sensor_types type,
>                                        u32 attr, int channel)
>   {
> +       int fan_count;
> +       int fan_speed;
> +
>         switch (type) {
>         case hwmon_pwm:
> +               fan_count = hp_wmi_get_fan_count_userdefine_trigger();
> +               if (attr == hwmon_pwm_enable && fan_count <= 0)
> +                       return 0;
>                 if (attr == hwmon_pwm_input && !hp_wmi_fan_control_supported())
>                         return 0;
>                 return 0644;
> @@ -2689,7 +2695,9 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
>                         if (hp_wmi_get_active_fan_speed(channel) >= 0)
>                                 return 0444;
>                 } else {
> -                       if (hp_wmi_get_fan_speed(channel) >= 0)
> +                       fan_speed = hp_wmi_get_fan_speed(channel);
> +                       pr_info("channel = %d | fan_speed = %d\n", channel, fan_speed);
> +                       if (fan_speed >= 0)
>                                 return 0444;
>                 }
>                 break;
> @@ -2905,6 +2913,7 @@ static int hp_wmi_hwmon_init(void)
>         struct device *dev = &hp_wmi_platform_dev->dev;
>         struct hp_wmi_hwmon_priv *priv;
>         struct device *hwmon;
> +       int fan_count;
>         int ret;
>
>         priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> @@ -2915,11 +2924,17 @@ static int hp_wmi_hwmon_init(void)
>         if (ret)
>                 return ret;
>
> +       hwmon = devm_hwmon_device_register_with_info(dev, "hp", priv,
> +                                                    &chip_info, NULL);
> +
> +       fan_count = hp_wmi_get_fan_count_userdefine_trigger();
> +       pr_info("fan_count = %d\n", fan_count);
> +       if (fan_count <= 0)
> +               return 0;
> +
>         ret = hp_wmi_setup_fan_settings(priv);
>         if (ret)
>                 return ret;
> -       hwmon = devm_hwmon_device_register_with_info(dev, "hp", priv,
> -                                                    &chip_info, NULL);
>
>         if (IS_ERR(hwmon)) {
>                 dev_err(dev, "Could not register hp hwmon device\n");
>
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
>
> >Thanks,
> >Lorenzo
> >
> >Il giorno lun 12 ott 2026 alle ore 17:24 Krishna Chomal
> ><krishna.chomal108@gmail.com> ha scritto:
> >>
> >> On Mon, Oct 12, 2026 at 10:08:43AM +0200, Lorenzo Collevecchio wrote:
> >> >Hi Armin, Krishna,
> >> >
> >> >Thanks for the quick replies.
> >> >
> >> >acpidump:
> >> >https://gist.github.com/CollevecchioLorenzo/aef5917d9775629d48618bd42cb5f5e2
> >> >
> >> >I booted 7.2.9-2-cachyos with modprobe.blacklist=hp_bioscfg
> >> >(confirmed in /proc/cmdline; hp_bioscfg is not loaded). Counts of
> >> >each message in dmesg, before and after:
> >> >
> >> >  WHCM AE_AML_OPERAND_TYPE:                 3 before, 3 after
> >> >  "Failed to apply initial fan settings: -22": 1 before, 1 after
> >> >  WQBC / WQBE AE_AML_OPERAND_VALUE:         1/1 before, 0/0 after
> >> >
> >> >So the WQBC/WQBE errors come from hp_bioscfg, as you suspected. The
> >> >WHCM errors and the -22 are not caused by it: they still occur with
> >> >hp_bioscfg blacklisted, right before "hp_wmi: Registered as platform
> >> >profile handler".
> >> >
> >> >Windows, as you asked (Krishna):
> >> >- The Windows power mode setting exists, but that is standard
> >> >  Windows, i didn't check for HP specific.
> >> >- Omen Gaming Hub offers a performance mode
> >> >  option on this laptop.
> >>
> >> Interesting, what choices does it offer you? Eco/Balanced/Performance?
> >> Or something else?
> >>
> >> >- The BIOS has a "Fan Always On" setting. I had it turned off
> >> >
> >> >Happy to test any patch or run further commands.
> >>
> >> Can you apply the following diff and share the output of:
> >> # dmesg | grep "hp_wmi"
> >>
> >> Expected results:
> >> - No "failed to apply initial fan settings: -22" in dmesg
> >> - pwm1_enable should be hidden
> >>
> >> Note:
> >> - I have also added a debug print to get fan speed query result. From your
> >>    acpidump, it looks like a stub implementation returning all zeros buffer
> >>    (0 RPM) which should have made fan{1,2}_input visible but it's interesting
> >>    that it isn't visible; the dmesg log should help us gain more insight.
> >> - All other errors in dmesg may (will) be same, as this patch isn't
> >>    intended to solve them.
> >>
> >> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> >> index 3ec6047c0f89..ee51790549ed 100644
> >> --- a/drivers/platform/x86/hp/hp-wmi.c
> >> +++ b/drivers/platform/x86/hp/hp-wmi.c
> >> @@ -2705,8 +2705,14 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
> >>                                        enum hwmon_sensor_types type,
> >>                                        u32 attr, int channel)
> >>   {
> >> +       int fan_count;
> >> +       int fan_speed;
> >> +
> >>         switch (type) {
> >>         case hwmon_pwm:
> >> +               fan_count = hp_wmi_get_fan_count_userdefine_trigger();
> >> +               if (attr == hwmon_pwm_enable && fan_count <= 0)
> >> +                       return 0;
> >>                 if (attr == hwmon_pwm_input && !hp_wmi_fan_control_supported())
> >>                         return 0;
> >>                 return 0644;
> >> @@ -2715,7 +2721,9 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
> >>                         if (hp_wmi_get_active_fan_speed(channel) >= 0)
> >>                                 return 0444;
> >>                 } else {
> >> -                       if (hp_wmi_get_fan_speed(channel) >= 0)
> >> +                       fan_speed = hp_wmi_get_fan_speed(channel);
> >> +                       pr_info("channel = %d | fan_speed = %d\n", channel, fan_speed);
> >> +                       if (fan_speed >= 0)
> >>                                 return 0444;
> >>                 }
> >>                 break;
> >> @@ -2931,8 +2939,13 @@ static int hp_wmi_hwmon_init(void)
> >>         struct device *dev = &hp_wmi_platform_dev->dev;
> >>         struct hp_wmi_hwmon_priv *priv;
> >>         struct device *hwmon;
> >> +       int fan_count;
> >>         int ret;
> >>
> >> +       fan_count = hp_wmi_get_fan_count_userdefine_trigger();
> >> +       if (fan_count <= 0)
> >> +               return 0;
> >> +
> >>         priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> >>         if (!priv)
> >>                 return -ENOMEM;
> >>
> >>
> >> >Thanks,
> >> >Lorenzo
> >> >
> >> >
> >> >
> >> >
> >> >Il giorno lun 12 ott 2026 alle ore 06:03 Krishna Chomal
> >> ><krishna.chomal108@gmail.com> ha scritto:
> >> >>
> >> >> +Armin Wolf
> >> >>
> >> >> On Sun, Oct 11, 2026 at 06:03:25PM +0200, Lorenzo Collevecchio wrote:
> >> >> >Hello,
> >> >> >
> >> >> >I am seeing hp-wmi fan interface failures on an HP OmniBook 5
> >> >> >16-ag1xxx. This is not a gaming model.
> >> >>
> >> >> Hi Lorenzo,
> >> >>
> >> >> Thanks for reporting.
> >> >>
> >> >> >Hardware:
> >> >> >  product_name: HP OmniBook 5 Laptop 16-ag1xxx (16-AG1002SL)
> >> >> >  board_name:   8DF4
> >> >> >  BIOS:         F.12, 04/10/2026 (no newer firmware listed on LVFS for
> >> >> >this machine)
> >> >> >  Kernel:       7.2.9-2-cachyos (also tested 6.18.55-2-cachyos-lts;
> >> >> >ACPICA 20250807 vs 20260408)
> >> >> >
> >> >> >Symptoms:
> >> >> >1. At boot, \_SB.WMID.WHCM (called via WMAA) fails three times with
> >> >> >   "AE_AML_OPERAND_TYPE: Needed [Buffer/String/Package], found
> >> >> >[Integer]" while resolving operands for [Index].
> >> >>
> >> >> This is likely due to hp-bioscfg instead of hp-wmi.
> >> >>
> >> >> >2. Immediately afterwards: "hp-wmi hp-wmi: Failed to apply initial fan
> >> >> >settings: -22".
> >> >>
> >> >> Ah yes! This is because we are currently enabling fan control for ALL
> >> >> devices. If you share your acpidump, I can check if we should use the
> >> >> HPWMI_FAN_COUNT_GET_QUERY to decide whether to allow pwm1_enable or not.
> >> >>
> >> >> >3. Later: "Attempt to CreateField of length zero" in \_SB.WMID.WQBC
> >> >> >and WQBE (AE_AML_OPERAND_VALUE).
> >> >>
> >> >> This is also likely due to hp-bioscfg. Try booting with kernel cmdline
> >> >> parameter "modprobe.blacklist=hp_bioscfg" and see if these disappear.
> >> >> That will help us narrow down the scope. But in any case, I think Armin
> >> >> Wolf will have to help here since I am not familiar with bioscfg anyway.
> >> >>
> >> >> >4. hp_wmi still registers as a platform profile handler (quiet
> >> >> >balanced performance).
> >> >>
> >> >> This is because 8DF4 is not present in any whitelists, so it takes a
> >> >> fallback path and uses legacy WMI queries. Honestly, I am not sure if
> >> >> platform profile should be registered for OmniBook devices. Could you
> >> >> let me know if Omen Gaming Hub on Windows allows you to switch
> >> >> performance modes or there is no option for this?
> >> >>
> >> >> >5. /sys/devices/platform/hp-wmi/hwmon/*/ contains only pwm1_enable
> >> >> >(rw); there is no pwm1 and no fan1_input.
> >> >>
> >> >> Intended.
> >> >>
> >> >> * pwm1_enable - As said, this is because we are currently (incorrectly)
> >> >>                  enabling fan control for all devices.
> >> >> * pwm1 - Absent because manual fan control must be unavailable on this
> >> >>           board.
> >> >> * fan1_input - Absent because get fan speed query must be failing.
> >> >>
> >> >> >6. On the LTS kernel the same WHCM error repeats about every 2.2 s
> >> >> >while something polls the hp hwmon device (277 times between 551 s and
> >> >> >1165 s uptime).
> >> >> >7. ACPI thermal: "Invalid critical threshold (-274000)" and "No valid
> >> >> >trip points!" for thermal zone TSZ0.
> >> >> >
> >> >> >Fan behaviour:
> >> >> >- acpi_fan (acpi-fan PNP0C0B, "Using Microsoft fan extensions")
> >> >> >exposes fan1_input. It sometimes shows about 2400 RPM and sometimes 0
> >> >> >RPM.
> >> >> >- The fan works normally under Windows on the same machine.
> >> >> >- I once saw the CPU around 95 C with the fan apparently stopped on
> >> >> >Linux; I have not been able to reproduce it yet and am collecting a
> >> >> >temperature/RPM log.
> >> >> >
> >> >> >I suspect the WMI query path the driver uses for fan settings is not
> >> >> >implemented by this firmware, so hp-wmi should probably not attempt it
> >> >> >on board 8DF4. I would be glad to test patches or provide acpidump
> >> >> >output, WMI GUID listings or any other data.
> >> >>
> >> >> acpidump would be helpful.
> >> >>
> >> >> Thanks,
> >> >> Krishna
> >> >>
> >> >> >Thanks,
> >> >> >Lorenzo
