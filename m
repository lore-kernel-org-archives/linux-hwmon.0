Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848BA4ABBCE
	for <linux-hwmon@vger.kernel.org>; Mon, 12 Oct 2026 16:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791821095; cv=pass; b=VfFOOTmrXBhH6Rwi44pmQjPK/zEVSIazVGVFr75yNrwWsz5yP7zmZdWinRhoAbuB7c4fDv4LA1qLYziFcby95sFvFtcV61ipUOOSbwb1a/TmLBNJTCDK3e/KIMfa0ubrveenpwc9BO7n6ZnHUozm3gT5L749hJOP1Soryd3rq74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791821095; c=relaxed/simple;
	bh=YDYLCLwgLcV2r5dJ9UzJ836Sq20OcLP+Wd6u1MUNL2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TfzwBmuxz4t6ygguDeWaynjI2yg8ONZn6tKPi6Sh3/yJ5Dt2U8O/+16H1reS/7fiaasg8M5pAtDO3GH+XAcDNX5trnjMYks8AUWmRu/mVDqhFB82aAaHj/OKB72UelayXWHwgs5Ag1MJv+nTmF8gFl9Sb36qfU/EcMb4MyCVAS4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OQOddmAr; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQOddmAr"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a77fd51505so2569521fa.2
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Oct 2026 09:04:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791821089; cv=none;
        d=google.com; s=arc-20260327;
        b=sWWUsJhB5sqXmV6ch0n4huINtP4kDE7uAY1PVSJe85nLHoPJysNK1lw/YmmSuP9+Xh
         VzOGlW6nZVSr7rgmgo4O4RJOG/LlA0OUX6C/c85FAjwQKlkLkQcCqHXdnaSEg7esjqSu
         Qpl9caiWvI7gK6tzGQPs+et/iXZSvRD3KigCQkxY+X1DPG/JLkvUVMfY4LKSNHb8eBtf
         belhe06e7gEDJ2UWneQnvp5hV29WU5u6rVFXHptMsIf5cJGk0dMVugSnLl8fl6nTCGTR
         l1Goc0i1dJw4GomAzMgLu/UgUemFM7JkeO08VnhzrnZdzKvkCmGDFL0KVLiSEbvxGGRR
         Bzvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ocr5oPmXQeazUfMR8PC+Ym3NuDxP5HzJs/xjAidmR/s=;
        fh=t918/Hnf2DBOrqi4IvhIuisQnT65z9sdeltn7qAWges=;
        b=STKAX8eKJQOTGWEpPjgwdjhT4Fqx0wD78LekuGcRUPI+YC2qaPOaAkuCN1qpargk0u
         EXkvPF+YcUbo3XebRezPrpy+ee37R0r/oaSipDLYixTreTPlO9f6LsEbfv29igcrNQj9
         8V5bsMVMm6l0r3ytRbsYbqRA+ZYlPJhtp0GVrYgHUdkKpoF/kH64tZgc8TrXFSJz929Z
         0Vy0M+WlQNDBagweeA33pKvRIlbALfIG0oDYfZ8YNeXqx9OZNa0scp/leC13HWEFaIiX
         FN4IhOcW31rVRU9RKACWybniRtcirXIxD6EcF42ZUVaNDPP08HKjXXhbqOh63jc1CQFt
         w8iQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791821089; x=1792425889; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ocr5oPmXQeazUfMR8PC+Ym3NuDxP5HzJs/xjAidmR/s=;
        b=OQOddmAr8lhzYnTXfe0M1rCRkTbDufEWLju0vIw5of/87KqC2SB3fe9QuK+U9vZfrB
         nnDG3DUHRumlQF68nS0ygUfouIzGE9elhFBvJO5fcm8YkGieE5uEElm7GBUoAfBvkNWj
         FCyDvvV+3gyr1KxD/j0tV/iftIVNnBH/DDPhu9MXPRhpN6fZ++JcJKTOf7r6Q2bUy6Ip
         H5wqGxxwX51L7wzDx1y63dh6etsyg0pREo+67ILmQPwqRqZTDCXiy2hCM4XlssVA6kKu
         KfzYR9cOGDh25l6PA5/WOOwnsJLS5SRfnN4WQ2mPXXof6sujZXCL1BHFuTH8G8RjptBa
         1GGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791821089; x=1792425889;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ocr5oPmXQeazUfMR8PC+Ym3NuDxP5HzJs/xjAidmR/s=;
        b=TJ5blHhwUnEeG8wtuCH2eGEXEJMUAGkLQ0Hz73pGhacIJiMMAThkBBNi4O4Jp/b58P
         RrNC086GN0UAlL7ukq3TVEibeDhfZSpUpZaKmSs1/voxNEsjvn9NL9wixP9o0w1AVYjo
         s5qqim/jLaiuJ6nV+y8jkLvQFyIIzASlunWsbb6IxMNXPZJv2KKfEH4tG10OON2JBGja
         ktq3pKweBnBD3V+hKRsix+hDdkXDr1S9Lswfp7bW6FLTv1ohNVAiuvIMoesQFILsJe+x
         jOV4DKqJlDq7DPJjewuJjwHe9/2nkxCX8yMVMqiWETk6gmnLZAWHJsMEqaVjlyUUnHOe
         Pgsg==
X-Forwarded-Encrypted: i=1; AKwUvByBJfnHsob0cw6mRuEL8VE4LgxlDQkf7iGIRYF36G0OmqwnADBsGy183gmXNzDZFZ1vkdUExKBci4YCfg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLmkOpttqpWKrvpHft9DEu2239zboJ5RY/X7QS/c2fcQfdz+ec2
	o9ttgDZWlrtUEbNkTyhtjlT6wFaKaBKKi6KqFoIdfzyCMrTAOalvXFGu11gVl0YpRxOcStBAHy0
	TyySawgqtag9U+WFxKucl6PJwSHhENLg=
X-Gm-Gg: AYBFou2wStkqjiv/3L1c9taHU8RTeGzw/o9Z+h+Ow+X5jFnbN+y7+FboSyC6S2zbYMq
	8hV8LAMk7ZQ2VT+YaBb63GXZtOILQ4tWfQP7v9L10c6DI5+ofn+tc5Oawfrjvk7VRnWzhDoPhK2
	9/MHNcQ3gX6w9eL6P3rL42txGR+VkbJ7bDu6b0V1n25le0rR7uv5lKln9WulXYE8/EOmH8cyTtg
	0NFtvaVZopb1h84yohpJtnyg39I/8IGYHBEPcObDaBpciQkQckK0jMEDOxlp+AIiJSM51Q0ABoI
	YTitSHu9fg23c/+rAY+eQ7pv3EQ8obo2jOMHMQA3H/ZVmFjyKSd7YmlVgc7iKKW0Sj47VuzM0Pp
	prgn7hoJ6kT6HSfgOqrbqVcX6
X-Received: by 2002:a05:6512:3c9f:b0:5bc:f871:2810 with SMTP id
 2adb3069b0e04-5bcf8712b1bmr964226e87.5.1791821088977; Mon, 12 Oct 2026
 09:04:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPvUaSo1D+1Tvk3-4TMiXw-ScBtY8Mu0FzO7R_EG6zrjYfjYqg@mail.gmail.com>
 <asxTYBiGy6lf6-Ki@archlinux> <CAPvUaSo-ubCOCYYPadY1C23y1Fd_AAhQLuVKWRa6F1XVh6mk_Q@mail.gmail.com>
 <asz7WqGzukhkYHGD@archlinux>
In-Reply-To: <asz7WqGzukhkYHGD@archlinux>
From: Lorenzo Collevecchio <lorenzocollevecchio17@gmail.com>
Date: Mon, 12 Oct 2026 18:04:37 +0200
X-Gm-Features: AclHuK-V2seTwpNkcOBu-d44QWxkLWSC59kZLFIM7qJ3qYiMq67CAxjyuxLkRus
Message-ID: <CAPvUaSrbWrBuvAi3R02xC8w8M5Yh97pVd3-+FBXLp3mPgG5cUQ@mail.gmail.com>
Subject: Re: hp-wmi: WHCM AE_AML_OPERAND_TYPE and fan init -22 on HP OmniBook
 5 16-ag1xxx (board 8DF4)
To: Krishna Chomal <krishna.chomal108@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, W_Armin@gmx.de
Content-Type: text/plain; charset="UTF-8"

Subject: Re: hp-wmi: WHCM AE_AML_OPERAND_TYPE and fan init -22 on HP
OmniBook 5 16-ag1xxx (board 8DF4)

Hi Krishna,

Thanks for the patch. Results below.

Base and adaptation:
I used drivers/platform/x86/hp/hp-wmi.c from stable v7.2.9, built out
of tree against 7.2.9-2-cachyos. Your diff did not apply cleanly: hunk
1 failed, because my hp_wmi_hwmon_is_visible() uses
is_victus_s_thermal_profile() and hp_wmi_get_fan_speed_victus_s()
rather than the helpers in your context lines. Hunks 2 and 3 applied
with offsets of about -230 lines. So I made these changes by hand:
  - declared int fan_speed in hp_wmi_hwmon_is_visible()
  - added your pr_info() and the fan_speed variable in the non-Victus
hwmon_fan branch
  - added the fan_count <= 0 early return in hp_wmi_hwmon_init()
I did NOT add the hwmon_pwm_enable check in is_visible(), since the
early return in init already prevents hwmon registration. If you want
me to test against a different tree, tell me which one.

Test: normal boot (hp_bioscfg not blacklisted), then rmmod hp_wmi and
insmod the patched module. Output of dmesg | grep -i -E
"hp.wmi|WHCM|WQB|fan", showing the stock boot first and then the
reload at about 5156 s:

[    6.453093] ACPI Error: Aborting method \_SB.WMID.WHCM ...
(AE_AML_OPERAND_TYPE)
[    6.655089] ACPI Error: Aborting method \_SB.WMID.WHCM ...
(AE_AML_OPERAND_TYPE)
[    6.857553] ACPI Error: Aborting method \_SB.WMID.WHCM ...
(AE_AML_OPERAND_TYPE)
[    6.857581] hp-wmi hp-wmi: Failed to apply initial fan settings: -22
[    7.262812] hp_wmi: Registered as platform profile handler
[    7.308567] ACPI Error: Aborting method \_SB.WMID.WQBC ...
(AE_AML_OPERAND_VALUE)
[    7.309182] ACPI Error: Aborting method \_SB.WMID.WQBE ...
(AE_AML_OPERAND_VALUE)
[ 5156.582212] hp_wmi: loading out-of-tree module taints kernel.
[ 5156.582224] hp_wmi: module verification failed: signature and/or
required key missing - tainting kernel
[ 5157.203181] input: HP WMI hotkeys as /devices/virtual/input/input27
[ 5157.614765] ACPI Error: Aborting method \_SB.WMID.WHCM ...
(AE_AML_OPERAND_TYPE)
[ 5158.026462] hp_wmi: Registered as platform profile handler

What I see with the patched module:
  - "Failed to apply initial fan settings: -22" is gone.
  - /sys/devices/platform/hp-wmi/hwmon/ does not exist any more, so
pwm1_enable is hidden as you expected.
  - Only one WHCM error is logged after the reload instead of three. I
do not know which call produces it; I am guessing it is the fan count
query.
  - No "channel = ... | fan_speed = ..." lines appear, because no
hwmon device is registered once fan_count <= 0, so is_visible() never
runs. If you want to see the fan speed query result, the print would
have to go somewhere that runs in this case. I can test a modified
patch.
  - WQBC/WQBE do not appear in the reload because only hp_wmi was
reloaded (hp_bioscfg stayed loaded).
  - The platform profile still registers with quiet balanced performance.

Fan Always On in the BIOS was off during all my tests.

Fan behaviour, in case it is useful: on a cold boot with a 2-core
stress-ng load, the CPU went from 46 C to 80 C in about 18 seconds
while acpi_fan fan1_input stayed at 0 RPM (Fan Always On off). I
stopped the test at 80 C. I can send the full log, and I can retest
with Fan Always On enabled if you want.

Happy to test further patches.

Thanks,
Lorenzo

Il giorno lun 12 ott 2026 alle ore 17:24 Krishna Chomal
<krishna.chomal108@gmail.com> ha scritto:
>
> On Mon, Oct 12, 2026 at 10:08:43AM +0200, Lorenzo Collevecchio wrote:
> >Hi Armin, Krishna,
> >
> >Thanks for the quick replies.
> >
> >acpidump:
> >https://gist.github.com/CollevecchioLorenzo/aef5917d9775629d48618bd42cb5f5e2
> >
> >I booted 7.2.9-2-cachyos with modprobe.blacklist=hp_bioscfg
> >(confirmed in /proc/cmdline; hp_bioscfg is not loaded). Counts of
> >each message in dmesg, before and after:
> >
> >  WHCM AE_AML_OPERAND_TYPE:                 3 before, 3 after
> >  "Failed to apply initial fan settings: -22": 1 before, 1 after
> >  WQBC / WQBE AE_AML_OPERAND_VALUE:         1/1 before, 0/0 after
> >
> >So the WQBC/WQBE errors come from hp_bioscfg, as you suspected. The
> >WHCM errors and the -22 are not caused by it: they still occur with
> >hp_bioscfg blacklisted, right before "hp_wmi: Registered as platform
> >profile handler".
> >
> >Windows, as you asked (Krishna):
> >- The Windows power mode setting exists, but that is standard
> >  Windows, i didn't check for HP specific.
> >- Omen Gaming Hub offers a performance mode
> >  option on this laptop.
>
> Interesting, what choices does it offer you? Eco/Balanced/Performance?
> Or something else?
>
> >- The BIOS has a "Fan Always On" setting. I had it turned off
> >
> >Happy to test any patch or run further commands.
>
> Can you apply the following diff and share the output of:
> # dmesg | grep "hp_wmi"
>
> Expected results:
> - No "failed to apply initial fan settings: -22" in dmesg
> - pwm1_enable should be hidden
>
> Note:
> - I have also added a debug print to get fan speed query result. From your
>    acpidump, it looks like a stub implementation returning all zeros buffer
>    (0 RPM) which should have made fan{1,2}_input visible but it's interesting
>    that it isn't visible; the dmesg log should help us gain more insight.
> - All other errors in dmesg may (will) be same, as this patch isn't
>    intended to solve them.
>
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 3ec6047c0f89..ee51790549ed 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -2705,8 +2705,14 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
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
> @@ -2715,7 +2721,9 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
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
> @@ -2931,8 +2939,13 @@ static int hp_wmi_hwmon_init(void)
>         struct device *dev = &hp_wmi_platform_dev->dev;
>         struct hp_wmi_hwmon_priv *priv;
>         struct device *hwmon;
> +       int fan_count;
>         int ret;
>
> +       fan_count = hp_wmi_get_fan_count_userdefine_trigger();
> +       if (fan_count <= 0)
> +               return 0;
> +
>         priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>         if (!priv)
>                 return -ENOMEM;
>
>
> >Thanks,
> >Lorenzo
> >
> >
> >
> >
> >Il giorno lun 12 ott 2026 alle ore 06:03 Krishna Chomal
> ><krishna.chomal108@gmail.com> ha scritto:
> >>
> >> +Armin Wolf
> >>
> >> On Sun, Oct 11, 2026 at 06:03:25PM +0200, Lorenzo Collevecchio wrote:
> >> >Hello,
> >> >
> >> >I am seeing hp-wmi fan interface failures on an HP OmniBook 5
> >> >16-ag1xxx. This is not a gaming model.
> >>
> >> Hi Lorenzo,
> >>
> >> Thanks for reporting.
> >>
> >> >Hardware:
> >> >  product_name: HP OmniBook 5 Laptop 16-ag1xxx (16-AG1002SL)
> >> >  board_name:   8DF4
> >> >  BIOS:         F.12, 04/10/2026 (no newer firmware listed on LVFS for
> >> >this machine)
> >> >  Kernel:       7.2.9-2-cachyos (also tested 6.18.55-2-cachyos-lts;
> >> >ACPICA 20250807 vs 20260408)
> >> >
> >> >Symptoms:
> >> >1. At boot, \_SB.WMID.WHCM (called via WMAA) fails three times with
> >> >   "AE_AML_OPERAND_TYPE: Needed [Buffer/String/Package], found
> >> >[Integer]" while resolving operands for [Index].
> >>
> >> This is likely due to hp-bioscfg instead of hp-wmi.
> >>
> >> >2. Immediately afterwards: "hp-wmi hp-wmi: Failed to apply initial fan
> >> >settings: -22".
> >>
> >> Ah yes! This is because we are currently enabling fan control for ALL
> >> devices. If you share your acpidump, I can check if we should use the
> >> HPWMI_FAN_COUNT_GET_QUERY to decide whether to allow pwm1_enable or not.
> >>
> >> >3. Later: "Attempt to CreateField of length zero" in \_SB.WMID.WQBC
> >> >and WQBE (AE_AML_OPERAND_VALUE).
> >>
> >> This is also likely due to hp-bioscfg. Try booting with kernel cmdline
> >> parameter "modprobe.blacklist=hp_bioscfg" and see if these disappear.
> >> That will help us narrow down the scope. But in any case, I think Armin
> >> Wolf will have to help here since I am not familiar with bioscfg anyway.
> >>
> >> >4. hp_wmi still registers as a platform profile handler (quiet
> >> >balanced performance).
> >>
> >> This is because 8DF4 is not present in any whitelists, so it takes a
> >> fallback path and uses legacy WMI queries. Honestly, I am not sure if
> >> platform profile should be registered for OmniBook devices. Could you
> >> let me know if Omen Gaming Hub on Windows allows you to switch
> >> performance modes or there is no option for this?
> >>
> >> >5. /sys/devices/platform/hp-wmi/hwmon/*/ contains only pwm1_enable
> >> >(rw); there is no pwm1 and no fan1_input.
> >>
> >> Intended.
> >>
> >> * pwm1_enable - As said, this is because we are currently (incorrectly)
> >>                  enabling fan control for all devices.
> >> * pwm1 - Absent because manual fan control must be unavailable on this
> >>           board.
> >> * fan1_input - Absent because get fan speed query must be failing.
> >>
> >> >6. On the LTS kernel the same WHCM error repeats about every 2.2 s
> >> >while something polls the hp hwmon device (277 times between 551 s and
> >> >1165 s uptime).
> >> >7. ACPI thermal: "Invalid critical threshold (-274000)" and "No valid
> >> >trip points!" for thermal zone TSZ0.
> >> >
> >> >Fan behaviour:
> >> >- acpi_fan (acpi-fan PNP0C0B, "Using Microsoft fan extensions")
> >> >exposes fan1_input. It sometimes shows about 2400 RPM and sometimes 0
> >> >RPM.
> >> >- The fan works normally under Windows on the same machine.
> >> >- I once saw the CPU around 95 C with the fan apparently stopped on
> >> >Linux; I have not been able to reproduce it yet and am collecting a
> >> >temperature/RPM log.
> >> >
> >> >I suspect the WMI query path the driver uses for fan settings is not
> >> >implemented by this firmware, so hp-wmi should probably not attempt it
> >> >on board 8DF4. I would be glad to test patches or provide acpidump
> >> >output, WMI GUID listings or any other data.
> >>
> >> acpidump would be helpful.
> >>
> >> Thanks,
> >> Krishna
> >>
> >> >Thanks,
> >> >Lorenzo
