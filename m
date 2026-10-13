Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0CB3FCB2C
	for <linux-hwmon@vger.kernel.org>; Tue, 13 Oct 2026 09:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791883988; cv=pass; b=a/J6AP3EkFTgCFbkrEt7C2UpMH+mLk1s0Cxu2QbYS64B0f3zs6dCebACdHoGSv6laqV1cfwsR+yIVyfbPLS6BwAPj7FyoJHRqYJDp3rqpqgaUzlwYO8igswala7QreplLtRbLG+PFvw+5u1IYcnP3wMP6s9KlXcXLqEjpbipLp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791883988; c=relaxed/simple;
	bh=1Crm4qjmoNuB16cp2SZ94FJWeQkpQGVI5hlQ/EBZ2TE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LW/5RMdPwMKHOxe1q6QOPCNp+57VJ0ognAub6PMCvuOSwXxlrwpVohPatpLeZSvQbRxTzTI5hXy1Uy3OrmMUdiv6Yje22SWxG36kMWsImCXr5mP1Frpv8KrzbF354AI0bvfwT+LOqyuIqcgO/KQKOOSGvZ5hF7PGdfVqKjUFnb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G3Cwgr+r; arc=pass smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G3Cwgr+r"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3a97c91a941so4433141fa.0
        for <linux-hwmon@vger.kernel.org>; Tue, 13 Oct 2026 02:33:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791883982; cv=none;
        d=google.com; s=arc-20260327;
        b=Ol/pqnBZ3PoIO7zelhfnAu7yXh0JpaCPiIXRmQfNimuLx1qrUcRz6r42TwiT12aE5i
         fpd+eBhk4zXwbaOQsGUCMgQfqJ2VZhBkFkx8SN+btuedqNWAeEqLLiQO/elV4IviM7E6
         0GnTz2ODnfcwSKG6xgXraaMh0M9TfhQPPLxpCdKrz0w28SZAK+4Rot9w8GLjl/ts6g02
         dr3LeDmWZH6QNJi30twFoCjQ/x2D8AiZJpt9QKo9CQtHJ3dU0UJWxQzbeVnhsjo9pbZ4
         nIEvJrX4UCoXg+r4OmlHoHIrcLpJdN2SWQe+l1ooKYczys0hp3inrrb7H7r+VRINbLyc
         GylQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pRwLN1HXklQGDQhD0jqoaIK3ji8FOSMvd/M3sHSlKQ4=;
        fh=kz8ZqllnMs3n0TaFrHS0GdtZ2H0ypbNhfMySEAVWWSs=;
        b=suyCUMw8Sug5Dm2vNT18Qqi7NTHQP95T/05SsTgjKdNhvF/SWIsxjAWZuZZtaFcjG/
         6txWDkG98fb+CxI4l4QNSLekIAPeCZ07Ufk9135sAb070SOMdYcd25XArtRyMdZ2znZl
         oiaPJFNiGvkhuqnWhQFXLThJd1WbI7xTgEhFY85KlSEDbeT67l5eHoxPSuOpdzWic/8S
         FMjEnY9CAjrH8qTZExaGCAoyRGpergu0oqSxJonoeDMmKeHqe6Q17pniU44DNQ4Ne76Z
         CGhTxdnhzZaqXYeRbOtX/rK2reV8VdX1cFh/hF4Gi7qnhwVqiwJlZvLNJxatvzWC/M0z
         UBJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791883982; x=1792488782; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pRwLN1HXklQGDQhD0jqoaIK3ji8FOSMvd/M3sHSlKQ4=;
        b=G3Cwgr+rml+tHJvJoKYGIyX4d0aCs/2HLR+GlpZyI1+5CEZyJBp0Kf/1SkspwMVFcz
         BUVucmSotJTdICPcjndPnaCm42qm/FvIqfUicp5zdKmCiUozxCHspF2veKMlqniROSbJ
         AVIBRCtOR6MXAcB3mZASwB1gl8KKMm609Ii+AHPZcicmSs6lfgYy/UmVeYAg3cbWjhnf
         b/TcfrFGPdNul+Q6DiTHiGfZpD8dp4KUtkKfpUDQDF34sbM95bpfgUpC7VJ3/TpQU6K1
         fmZqBzl3v4U2euuWUtA+pr21Qwf6lmv0DcQRyKrcByTMncBYYC/O91EE7Urpg/OkYMAT
         F7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791883982; x=1792488782;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pRwLN1HXklQGDQhD0jqoaIK3ji8FOSMvd/M3sHSlKQ4=;
        b=PeHxJ8cDw7BUjEAU8KK2rjn+6G+zzt085u1kst62qzOcTyrmSwdnzsAorWLU8nBHjb
         h8Vucv9zOmcaKcw2ctSpHtrk3d0sRiAEb8Dp7RRGBn7nBNYAtMtp+ItoW3QxTYroTbI5
         7EYt1yiGC4/ytGfnSIdp+lRp+dzpsC0/XifJwWbpxU07KYbepHptv8eLFL3S48xLRotU
         evwWSpdy60VWWLY6elluwQuw6q7Kgx+lWZKSxFvb+ZsPj2tPttBMCVN38jCtF0pKHfp6
         qFyllvUqneEOye74pX7G8A3klPmaCrXIuc6gJlP9BrNN/l2Rwn9xrWfs79VIgsJ6iQYN
         eLTQ==
X-Forwarded-Encrypted: i=1; AKwUvBy1GYadQCbvPLLo9MaYfa5blPOt39NwtdL/kZtLl/looRo7wJEpvVl8qAvVaHXuTC9tzRLm+xbQLow6vw==@vger.kernel.org
X-Gm-Message-State: AFq9FYK0MEIGYPqlZyQSAHSNkDmTw7rV8KoohtQLsw9UicBLjkVvdn1L
	9B1lvc7B7/+xb3FCb1wkMHbQf7Qa9W7H1RSm2czVcUlKcSrlij+tEgp98gekVLfuHyW/NjXEF21
	3qw0uJ8zTFN3PqZ6WdBonmLKHCyr7gP0=
X-Gm-Gg: AYBFou3ogL1FJ/u9HD0GBott8D/HX8slLYTgUc2dHsmnlY0aXdaD80IUp9hgSk5Wo6o
	e35elayoOyf36vThLwpNNqEUPyOzaw5IWrnp5c/zsOsQCzM7jOoURqj53sDhhySV/qKgSRw6o5S
	QP1f2//C8e9SXX8+txGRPQZuFgw/pn8RzfH3bs3rFL6qrc650neM66rmZUBbMzrZ7yxz5rE0/2m
	ld10hIVJUFI9zWtlSvIbdOpSb0ePQJHxJ4LYAQMeohrSZU/oMGxudXQZuCJPukBbqi8xSETECa0
	28Mgk19PCtBBlYp+2Ib3GSOrSzEHCXahPKG3ALVc9wUlaZHIlgjxsNMF7Ucj2Y/Vuos=
X-Received: by 2002:a05:6512:61ac:b0:5bc:e45b:bf21 with SMTP id
 2adb3069b0e04-5bce45bc064mr3980452e87.2.1791883981594; Tue, 13 Oct 2026
 02:33:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPvUaSo1D+1Tvk3-4TMiXw-ScBtY8Mu0FzO7R_EG6zrjYfjYqg@mail.gmail.com>
 <asxTYBiGy6lf6-Ki@archlinux> <CAPvUaSo-ubCOCYYPadY1C23y1Fd_AAhQLuVKWRa6F1XVh6mk_Q@mail.gmail.com>
 <asz7WqGzukhkYHGD@archlinux> <CAPvUaSrbWrBuvAi3R02xC8w8M5Yh97pVd3-+FBXLp3mPgG5cUQ@mail.gmail.com>
 <as0bOFOoaaw-smyB@archlinux> <CAPvUaSoBgAG=MX93vMhfEiEk5bYXGydFsGn8CpoCu_QVQRPTCQ@mail.gmail.com>
In-Reply-To: <CAPvUaSoBgAG=MX93vMhfEiEk5bYXGydFsGn8CpoCu_QVQRPTCQ@mail.gmail.com>
From: Lorenzo Collevecchio <lorenzocollevecchio17@gmail.com>
Date: Tue, 13 Oct 2026 11:32:49 +0200
X-Gm-Features: AclHuK-r9Qwz5SM-f7s1q5uAVypmkQXFiVFrSEsvPQ7FSKEcsKxlj_Z-WlUsDDI
Message-ID: <CAPvUaSpPVYc-5M72G0Hf9JPsbdAp2-4f-p5OetYbMKdLqm0PXQ@mail.gmail.com>
Subject: Re: hp-wmi: WHCM AE_AML_OPERAND_TYPE and fan init -22 on HP OmniBook
 5 16-ag1xxx (board 8DF4)
To: Krishna Chomal <krishna.chomal108@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, W_Armin@gmx.de
Content-Type: text/plain; charset="UTF-8"

Subject: Re: hp-wmi: WHCM AE_AML_OPERAND_TYPE and fan init -22 on HP
OmniBook 5 16-ag1xxx (board 8DF4)

Hi Krishna,

A follow-up with more data while you look at the previous results. No rush.

1) Same board on Linux Mint 22.3 (live USB, kernel 6.14.0-37-generic,
ACPICA 20240827), board 8DF4, BIOS F.12:
  - WHCM aborts with AE_AML_OPERAND_TYPE twice at boot (11.7 s and
11.9 s), the same error as on 7.2.9. The ACPI thermal warnings are
identical (invalid critical threshold -274000, no valid trip points).
  - "Failed to apply initial fan settings" is not printed.
/sys/devices/platform/hp-wmi/hwmon/ contains name, power, pwm1_enable,
subsystem, uevent, so there is again a pwm1_enable and nothing else.
  - hp_bioscfg was not loaded and there are no WQBC/WQBE errors,
consistent with the blacklist result I sent earlier.
  - The hwmon list has no fan sensor at all (ACAD, acpitz, BAT1, nvme,
ucsi, k10temp, hp, amdgpu), whereas CachyOS has acpi_fan with
fan1_input.
  - With a 2-core load the CPU went from 37 C to 80 C in about 23
seconds and I could hear the fan running, so the firmware starts the
fan on this hardware without any help from hp-wmi.

2) Fan behaviour on CachyOS 7.2.9 (stock hp-wmi, acpi_fan fan1_input,
Fan Always On disabled):
  - Idle, CPU about 30-40 C, on AC and after unplugging: fan audible
and fan1_input steady at about 2300 RPM for several minutes. Then it
dropped to 0 RPM by itself at about 39 C. Earlier, during a light
game, it showed about 2400 RPM at 50-55 C. I have never seen an
intermediate value, only about 2300-2400 or 0.
  - Short stress-ng bursts (boost on): 46 -> 80 C in 18 s and 37 -> 73
C in about 35 s, with fan1_input at 0 for every sample.  Fan was off
during this stress test.

So the fan state does not seem to follow CPU temperature alone: it ran
at 30 C while idle, first plugged in and then after unplugging, and
did not read as running at 70-80 C during short bursts. I do not know
what else the firmware looks at.

Questions:
  - Is the acpi_fan reading of 0 RPM trustworthy on this firmware (is
_FST implemented properly), or could it be reporting 0 while the fan
runs?
  - Does anything in the DSDT/EC code suggest what drives the fan
decision (battery, charging, a timer)?

Happy to test any patch and to send more logs.

Thanks,
Lorenzo

Il giorno lun 12 ott 2026 alle ore 21:34 Lorenzo Collevecchio
<lorenzocollevecchio17@gmail.com> ha scritto:
>
> Subject: Re: hp-wmi: WHCM AE_AML_OPERAND_TYPE and fan init -22 on HP
> OmniBook 5 16-ag1xxx (board 8DF4)
>
> Hi Krishna,
>
> No problem, thanks for the revised patch.
>
> Base: stable v7.2.9 (drivers/platform/x86/hp/hp-wmi.c), built out of
> tree against 7.2.9-2-cachyos. I applied your three hunks by hand,
> because the context in my tree differs (my hp_wmi_hwmon_is_visible()
> uses is_victus_s_thermal_profile()). The resulting hp_wmi_hwmon_init()
> has the same structure as your diff: hwmon registration first, then
> fan_count with the pr_info, then the early return before
> hp_wmi_setup_fan_settings().
>
> Test: normal boot (hp_bioscfg loaded), rmmod hp_wmi, insmod the
> patched module. dmesg after the reload:
>
> [  318.615352] hp_wmi: loading out-of-tree module taints kernel.
> [  319.235086] input: HP WMI hotkeys as /devices/virtual/input/input27
> [  319.646490] ACPI Error: Aborting method \_SB.WMID.WHCM due to
> previous error (AE_AML_OPERAND_TYPE)
> [  319.646528] hp_wmi: channel = 0 | fan_speed = -22
> [  319.851354] ACPI Error: Aborting method \_SB.WMID.WHCM due to
> previous error (AE_AML_OPERAND_TYPE)
> [  319.851395] hp_wmi: channel = 1 | fan_speed = -22
> [  320.056884] ACPI Error: Aborting method \_SB.WMID.WHCM due to
> previous error (AE_AML_OPERAND_TYPE)
> [  320.262561] ACPI Error: Aborting method \_SB.WMID.WHCM due to
> previous error (AE_AML_OPERAND_TYPE)
> [  320.466854] ACPI Error: Aborting method \_SB.WMID.WHCM due to
> previous error (AE_AML_OPERAND_TYPE)
> [  320.466894] hp_wmi: fan_count = -22
> [  320.878745] hp_wmi: Registered as platform profile handler
>
> hwmon folder: contains only device, name, power, subsystem, uevent. No
> pwm1_enable, and no fan*_input.
>
> So:
>   - The hwmon device is registered and pwm1_enable is hidden, as you expected.
>   - "Failed to apply initial fan settings: -22" is no longer printed.
>   - fan1_input/fan2_input are not visible because
> hp_wmi_get_fan_speed() returns -22 for both channels, not 0. Each of
> these queries (fan speed per channel, and fan count) ends in a WHCM
> abort with AE_AML_OPERAND_TYPE, so no result buffer is returned at
> all, rather than a stub all-zero one.
>   - fan_count is also -22, which is why the early return is taken.
>
> I wonder whether the AML error depends on what the driver passes in:
> the error says Index() found an Integer where it needs a
> Buffer/String/Package. Does it look to you as if WHCM expects a
> different argument layout than the driver sends for these queries? I
> can test any variant.
>
> Happy to test further patches.
>
> Thanks,
> Lorenzo
>
> Il giorno lun 12 ott 2026 alle ore 19:49 Krishna Chomal
> <krishna.chomal108@gmail.com> ha scritto:
> >
> > On Mon, Oct 12, 2026 at 06:04:37PM +0200, Lorenzo Collevecchio wrote:
> > >Subject: Re: hp-wmi: WHCM AE_AML_OPERAND_TYPE and fan init -22 on HP
> > >OmniBook 5 16-ag1xxx (board 8DF4)
> > >
> > >Hi Krishna,
> > >
> > >Thanks for the patch. Results below.
> > >
> > >Base and adaptation:
> > >I used drivers/platform/x86/hp/hp-wmi.c from stable v7.2.9, built out
> > >of tree against 7.2.9-2-cachyos. Your diff did not apply cleanly: hunk
> > >1 failed, because my hp_wmi_hwmon_is_visible() uses
> > >is_victus_s_thermal_profile() and hp_wmi_get_fan_speed_victus_s()
> > >rather than the helpers in your context lines. Hunks 2 and 3 applied
> > >with offsets of about -230 lines. So I made these changes by hand:
> > >  - declared int fan_speed in hp_wmi_hwmon_is_visible()
> > >  - added your pr_info() and the fan_speed variable in the non-Victus
> > >hwmon_fan branch
> > >  - added the fan_count <= 0 early return in hp_wmi_hwmon_init()
> > >I did NOT add the hwmon_pwm_enable check in is_visible(), since the
> > >early return in init already prevents hwmon registration. If you want
> > >me to test against a different tree, tell me which one.
> > >
> > >Test: normal boot (hp_bioscfg not blacklisted), then rmmod hp_wmi and
> > >insmod the patched module. Output of dmesg | grep -i -E
> > >"hp.wmi|WHCM|WQB|fan", showing the stock boot first and then the
> > >reload at about 5156 s:
> > >
> > >[    6.453093] ACPI Error: Aborting method \_SB.WMID.WHCM ...
> > >(AE_AML_OPERAND_TYPE)
> > >[    6.655089] ACPI Error: Aborting method \_SB.WMID.WHCM ...
> > >(AE_AML_OPERAND_TYPE)
> > >[    6.857553] ACPI Error: Aborting method \_SB.WMID.WHCM ...
> > >(AE_AML_OPERAND_TYPE)
> > >[    6.857581] hp-wmi hp-wmi: Failed to apply initial fan settings: -22
> > >[    7.262812] hp_wmi: Registered as platform profile handler
> > >[    7.308567] ACPI Error: Aborting method \_SB.WMID.WQBC ...
> > >(AE_AML_OPERAND_VALUE)
> > >[    7.309182] ACPI Error: Aborting method \_SB.WMID.WQBE ...
> > >(AE_AML_OPERAND_VALUE)
> > >[ 5156.582212] hp_wmi: loading out-of-tree module taints kernel.
> > >[ 5156.582224] hp_wmi: module verification failed: signature and/or
> > >required key missing - tainting kernel
> > >[ 5157.203181] input: HP WMI hotkeys as /devices/virtual/input/input27
> > >[ 5157.614765] ACPI Error: Aborting method \_SB.WMID.WHCM ...
> > >(AE_AML_OPERAND_TYPE)
> > >[ 5158.026462] hp_wmi: Registered as platform profile handler
> > >
> > >What I see with the patched module:
> > >  - "Failed to apply initial fan settings: -22" is gone.
> > >  - /sys/devices/platform/hp-wmi/hwmon/ does not exist any more, so
> > >pwm1_enable is hidden as you expected.
> > >  - Only one WHCM error is logged after the reload instead of three. I
> > >do not know which call produces it; I am guessing it is the fan count
> > >query.
> > >  - No "channel = ... | fan_speed = ..." lines appear, because no
> > >hwmon device is registered once fan_count <= 0, so is_visible() never
> > >runs. If you want to see the fan speed query result, the print would
> > >have to go somewhere that runs in this case. I can test a modified
> > >patch.
> > >  - WQBC/WQBE do not appear in the reload because only hp_wmi was
> > >reloaded (hp_bioscfg stayed loaded).
> > >  - The platform profile still registers with quiet balanced performance.
> > >
> > >Fan Always On in the BIOS was off during all my tests.
> > >
> > >Fan behaviour, in case it is useful: on a cold boot with a 2-core
> > >stress-ng load, the CPU went from 46 C to 80 C in about 18 seconds
> > >while acpi_fan fan1_input stayed at 0 RPM (Fan Always On off). I
> > >stopped the test at 80 C. I can send the full log, and I can retest
> > >with Fan Always On enabled if you want.
> > >
> > >Happy to test further patches.
> >
> > My fault, sorry. I should have clarified earlier that my patch was
> > based off of pdx86 tree[1] (master branch). Regarding the patch yes,
> > by mistake I ended up disabling the whole hwmon device (not what we
> > want). Let's register the hwmon device first then later handle the fan
> > logic optionally with the count guards.
> >
> > Now hwmon should be available but pwm1_enable will be hidden. Also,
> > fan{1,2}_input is expected to be visible, I am not sure why it isn't
> > showing up for your device.
> >
> > (as usual, rest all errors would be same)
> >
> > diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> > index b2773fc1aca4..422d65d5c514 100644
> > --- a/drivers/platform/x86/hp/hp-wmi.c
> > +++ b/drivers/platform/x86/hp/hp-wmi.c
> > @@ -2679,8 +2679,14 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
> >                                        enum hwmon_sensor_types type,
> >                                        u32 attr, int channel)
> >   {
> > +       int fan_count;
> > +       int fan_speed;
> > +
> >         switch (type) {
> >         case hwmon_pwm:
> > +               fan_count = hp_wmi_get_fan_count_userdefine_trigger();
> > +               if (attr == hwmon_pwm_enable && fan_count <= 0)
> > +                       return 0;
> >                 if (attr == hwmon_pwm_input && !hp_wmi_fan_control_supported())
> >                         return 0;
> >                 return 0644;
> > @@ -2689,7 +2695,9 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
> >                         if (hp_wmi_get_active_fan_speed(channel) >= 0)
> >                                 return 0444;
> >                 } else {
> > -                       if (hp_wmi_get_fan_speed(channel) >= 0)
> > +                       fan_speed = hp_wmi_get_fan_speed(channel);
> > +                       pr_info("channel = %d | fan_speed = %d\n", channel, fan_speed);
> > +                       if (fan_speed >= 0)
> >                                 return 0444;
> >                 }
> >                 break;
> > @@ -2905,6 +2913,7 @@ static int hp_wmi_hwmon_init(void)
> >         struct device *dev = &hp_wmi_platform_dev->dev;
> >         struct hp_wmi_hwmon_priv *priv;
> >         struct device *hwmon;
> > +       int fan_count;
> >         int ret;
> >
> >         priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > @@ -2915,11 +2924,17 @@ static int hp_wmi_hwmon_init(void)
> >         if (ret)
> >                 return ret;
> >
> > +       hwmon = devm_hwmon_device_register_with_info(dev, "hp", priv,
> > +                                                    &chip_info, NULL);
> > +
> > +       fan_count = hp_wmi_get_fan_count_userdefine_trigger();
> > +       pr_info("fan_count = %d\n", fan_count);
> > +       if (fan_count <= 0)
> > +               return 0;
> > +
> >         ret = hp_wmi_setup_fan_settings(priv);
> >         if (ret)
> >                 return ret;
> > -       hwmon = devm_hwmon_device_register_with_info(dev, "hp", priv,
> > -                                                    &chip_info, NULL);
> >
> >         if (IS_ERR(hwmon)) {
> >                 dev_err(dev, "Could not register hp hwmon device\n");
> >
> > [1]: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
> >
> > >Thanks,
> > >Lorenzo
> > >
> > >Il giorno lun 12 ott 2026 alle ore 17:24 Krishna Chomal
> > ><krishna.chomal108@gmail.com> ha scritto:
> > >>
> > >> On Mon, Oct 12, 2026 at 10:08:43AM +0200, Lorenzo Collevecchio wrote:
> > >> >Hi Armin, Krishna,
> > >> >
> > >> >Thanks for the quick replies.
> > >> >
> > >> >acpidump:
> > >> >https://gist.github.com/CollevecchioLorenzo/aef5917d9775629d48618bd42cb5f5e2
> > >> >
> > >> >I booted 7.2.9-2-cachyos with modprobe.blacklist=hp_bioscfg
> > >> >(confirmed in /proc/cmdline; hp_bioscfg is not loaded). Counts of
> > >> >each message in dmesg, before and after:
> > >> >
> > >> >  WHCM AE_AML_OPERAND_TYPE:                 3 before, 3 after
> > >> >  "Failed to apply initial fan settings: -22": 1 before, 1 after
> > >> >  WQBC / WQBE AE_AML_OPERAND_VALUE:         1/1 before, 0/0 after
> > >> >
> > >> >So the WQBC/WQBE errors come from hp_bioscfg, as you suspected. The
> > >> >WHCM errors and the -22 are not caused by it: they still occur with
> > >> >hp_bioscfg blacklisted, right before "hp_wmi: Registered as platform
> > >> >profile handler".
> > >> >
> > >> >Windows, as you asked (Krishna):
> > >> >- The Windows power mode setting exists, but that is standard
> > >> >  Windows, i didn't check for HP specific.
> > >> >- Omen Gaming Hub offers a performance mode
> > >> >  option on this laptop.
> > >>
> > >> Interesting, what choices does it offer you? Eco/Balanced/Performance?
> > >> Or something else?
> > >>
> > >> >- The BIOS has a "Fan Always On" setting. I had it turned off
> > >> >
> > >> >Happy to test any patch or run further commands.
> > >>
> > >> Can you apply the following diff and share the output of:
> > >> # dmesg | grep "hp_wmi"
> > >>
> > >> Expected results:
> > >> - No "failed to apply initial fan settings: -22" in dmesg
> > >> - pwm1_enable should be hidden
> > >>
> > >> Note:
> > >> - I have also added a debug print to get fan speed query result. From your
> > >>    acpidump, it looks like a stub implementation returning all zeros buffer
> > >>    (0 RPM) which should have made fan{1,2}_input visible but it's interesting
> > >>    that it isn't visible; the dmesg log should help us gain more insight.
> > >> - All other errors in dmesg may (will) be same, as this patch isn't
> > >>    intended to solve them.
> > >>
> > >> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> > >> index 3ec6047c0f89..ee51790549ed 100644
> > >> --- a/drivers/platform/x86/hp/hp-wmi.c
> > >> +++ b/drivers/platform/x86/hp/hp-wmi.c
> > >> @@ -2705,8 +2705,14 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
> > >>                                        enum hwmon_sensor_types type,
> > >>                                        u32 attr, int channel)
> > >>   {
> > >> +       int fan_count;
> > >> +       int fan_speed;
> > >> +
> > >>         switch (type) {
> > >>         case hwmon_pwm:
> > >> +               fan_count = hp_wmi_get_fan_count_userdefine_trigger();
> > >> +               if (attr == hwmon_pwm_enable && fan_count <= 0)
> > >> +                       return 0;
> > >>                 if (attr == hwmon_pwm_input && !hp_wmi_fan_control_supported())
> > >>                         return 0;
> > >>                 return 0644;
> > >> @@ -2715,7 +2721,9 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
> > >>                         if (hp_wmi_get_active_fan_speed(channel) >= 0)
> > >>                                 return 0444;
> > >>                 } else {
> > >> -                       if (hp_wmi_get_fan_speed(channel) >= 0)
> > >> +                       fan_speed = hp_wmi_get_fan_speed(channel);
> > >> +                       pr_info("channel = %d | fan_speed = %d\n", channel, fan_speed);
> > >> +                       if (fan_speed >= 0)
> > >>                                 return 0444;
> > >>                 }
> > >>                 break;
> > >> @@ -2931,8 +2939,13 @@ static int hp_wmi_hwmon_init(void)
> > >>         struct device *dev = &hp_wmi_platform_dev->dev;
> > >>         struct hp_wmi_hwmon_priv *priv;
> > >>         struct device *hwmon;
> > >> +       int fan_count;
> > >>         int ret;
> > >>
> > >> +       fan_count = hp_wmi_get_fan_count_userdefine_trigger();
> > >> +       if (fan_count <= 0)
> > >> +               return 0;
> > >> +
> > >>         priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > >>         if (!priv)
> > >>                 return -ENOMEM;
> > >>
> > >>
> > >> >Thanks,
> > >> >Lorenzo
> > >> >
> > >> >
> > >> >
> > >> >
> > >> >Il giorno lun 12 ott 2026 alle ore 06:03 Krishna Chomal
> > >> ><krishna.chomal108@gmail.com> ha scritto:
> > >> >>
> > >> >> +Armin Wolf
> > >> >>
> > >> >> On Sun, Oct 11, 2026 at 06:03:25PM +0200, Lorenzo Collevecchio wrote:
> > >> >> >Hello,
> > >> >> >
> > >> >> >I am seeing hp-wmi fan interface failures on an HP OmniBook 5
> > >> >> >16-ag1xxx. This is not a gaming model.
> > >> >>
> > >> >> Hi Lorenzo,
> > >> >>
> > >> >> Thanks for reporting.
> > >> >>
> > >> >> >Hardware:
> > >> >> >  product_name: HP OmniBook 5 Laptop 16-ag1xxx (16-AG1002SL)
> > >> >> >  board_name:   8DF4
> > >> >> >  BIOS:         F.12, 04/10/2026 (no newer firmware listed on LVFS for
> > >> >> >this machine)
> > >> >> >  Kernel:       7.2.9-2-cachyos (also tested 6.18.55-2-cachyos-lts;
> > >> >> >ACPICA 20250807 vs 20260408)
> > >> >> >
> > >> >> >Symptoms:
> > >> >> >1. At boot, \_SB.WMID.WHCM (called via WMAA) fails three times with
> > >> >> >   "AE_AML_OPERAND_TYPE: Needed [Buffer/String/Package], found
> > >> >> >[Integer]" while resolving operands for [Index].
> > >> >>
> > >> >> This is likely due to hp-bioscfg instead of hp-wmi.
> > >> >>
> > >> >> >2. Immediately afterwards: "hp-wmi hp-wmi: Failed to apply initial fan
> > >> >> >settings: -22".
> > >> >>
> > >> >> Ah yes! This is because we are currently enabling fan control for ALL
> > >> >> devices. If you share your acpidump, I can check if we should use the
> > >> >> HPWMI_FAN_COUNT_GET_QUERY to decide whether to allow pwm1_enable or not.
> > >> >>
> > >> >> >3. Later: "Attempt to CreateField of length zero" in \_SB.WMID.WQBC
> > >> >> >and WQBE (AE_AML_OPERAND_VALUE).
> > >> >>
> > >> >> This is also likely due to hp-bioscfg. Try booting with kernel cmdline
> > >> >> parameter "modprobe.blacklist=hp_bioscfg" and see if these disappear.
> > >> >> That will help us narrow down the scope. But in any case, I think Armin
> > >> >> Wolf will have to help here since I am not familiar with bioscfg anyway.
> > >> >>
> > >> >> >4. hp_wmi still registers as a platform profile handler (quiet
> > >> >> >balanced performance).
> > >> >>
> > >> >> This is because 8DF4 is not present in any whitelists, so it takes a
> > >> >> fallback path and uses legacy WMI queries. Honestly, I am not sure if
> > >> >> platform profile should be registered for OmniBook devices. Could you
> > >> >> let me know if Omen Gaming Hub on Windows allows you to switch
> > >> >> performance modes or there is no option for this?
> > >> >>
> > >> >> >5. /sys/devices/platform/hp-wmi/hwmon/*/ contains only pwm1_enable
> > >> >> >(rw); there is no pwm1 and no fan1_input.
> > >> >>
> > >> >> Intended.
> > >> >>
> > >> >> * pwm1_enable - As said, this is because we are currently (incorrectly)
> > >> >>                  enabling fan control for all devices.
> > >> >> * pwm1 - Absent because manual fan control must be unavailable on this
> > >> >>           board.
> > >> >> * fan1_input - Absent because get fan speed query must be failing.
> > >> >>
> > >> >> >6. On the LTS kernel the same WHCM error repeats about every 2.2 s
> > >> >> >while something polls the hp hwmon device (277 times between 551 s and
> > >> >> >1165 s uptime).
> > >> >> >7. ACPI thermal: "Invalid critical threshold (-274000)" and "No valid
> > >> >> >trip points!" for thermal zone TSZ0.
> > >> >> >
> > >> >> >Fan behaviour:
> > >> >> >- acpi_fan (acpi-fan PNP0C0B, "Using Microsoft fan extensions")
> > >> >> >exposes fan1_input. It sometimes shows about 2400 RPM and sometimes 0
> > >> >> >RPM.
> > >> >> >- The fan works normally under Windows on the same machine.
> > >> >> >- I once saw the CPU around 95 C with the fan apparently stopped on
> > >> >> >Linux; I have not been able to reproduce it yet and am collecting a
> > >> >> >temperature/RPM log.
> > >> >> >
> > >> >> >I suspect the WMI query path the driver uses for fan settings is not
> > >> >> >implemented by this firmware, so hp-wmi should probably not attempt it
> > >> >> >on board 8DF4. I would be glad to test patches or provide acpidump
> > >> >> >output, WMI GUID listings or any other data.
> > >> >>
> > >> >> acpidump would be helpful.
> > >> >>
> > >> >> Thanks,
> > >> >> Krishna
> > >> >>
> > >> >> >Thanks,
> > >> >> >Lorenzo
