Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094A33542D4
	for <linux-hwmon@vger.kernel.org>; Fri, 16 Oct 2026 07:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792134381; cv=pass; b=PbHgs82trhveSa9jb/7XvPSkDc6i0C4R3NepqjtN1E4chae+0cOxqmXtOJMdhA4YqPBsvlRiEGXPsolUpB2LpaYRACc1D9m2d5FDPmVaqKSX7N8t0DVyfIEHypx1tRs8W97auVlZxXgdNgduQiBzYY9O4vUsv/O52tSS4zFQoV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792134381; c=relaxed/simple;
	bh=kS9daXgxbk+dsQ8u/PDgRK8WJyw8SPd5ZZ3OwxIrdIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nzbyWNKn9Ym80/c5mjbLcBzGQk1syQXv22ZUVbm2QZu/7epIpnQ7RJ0MKhvPxNqofnCSEUpLaj2L5+KlYglbsBYTEPfg8QZN4rbmoVyOn0dLOQYHuOTxGHLpFfz+pFxIWEFJrKi05eQepnmJxja7JvGB14Ya7REds/PRqY1mjtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TZLPiT2W; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TZLPiT2W"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bb7ad903d0so754625e87.3
        for <linux-hwmon@vger.kernel.org>; Fri, 16 Oct 2026 00:06:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792134376; cv=none;
        d=google.com; s=arc-20260327;
        b=ITZfjYzcTj/QOXVZn5I8fk9e59/IZk4DVEVpvZcpUx/r8YLso/k3owwuyimzl6hqdG
         0qsyceH0hg130cBFTBRvz0WZ7rds5gugN0hluSel3fZnCWYV2Jm5U0Cth8sm6xdcM+If
         7AIlG0x3txkijXXnIkmEJ5Apzr2hjVhHZdr0UWyBfk6BKcvxmYjhZLGQZKV4+Sw/WBX7
         6pJ/jsIzp0zimYcmtyKtLwcNZ7qb0l5j7Dg1RrY3Y+h6ZEzp4XjOJh7cltBHhxFWVLLN
         GdtEz/6XRKSOcUx4XdjOtgrsAJqJBlXM3EvR5+ibCgZBZgSmNhatIvJpjr32N+Z9xJaQ
         E1Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/2jqa+k0beoa2e8GpEXqYDpFzH47mftrDYLKkFwy9jU=;
        fh=puE4pnGlFKSBCL9mEIYvooiM08jXONl4dK3saQCmuLc=;
        b=gayVE4IAZ932wlENDbG2u1MfbdIKZu/6VEMOh8IG/E8006+QCI/lCrmK52ZU/YRDQy
         zRYDzh0diu8pP5TRITFQa8wZa9lGHPu5smWXZRtrDy3q00Mv+4E+7ryZAUoH7Gm7xXD8
         7UeLbolCbrjIGtJH/ZrhsAN/F67rZ8BO7hJXlbXzdurmjbA+efpBnJHTf8MXMnxcNAkz
         /3C/qz+tUDsOxxSYMrBS7BddPdNexYQHuu6d6tmTD/7wgDumHHnHR3eYkc/i/LGgj4im
         EJzMPQ2e2cNowZ0v9Ng4xrbE8MTEIzdaq8TqDuW1rW4+0NNWZfZ8iEzsyNdA9CUBIZ2L
         TdLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792134376; x=1792739176; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/2jqa+k0beoa2e8GpEXqYDpFzH47mftrDYLKkFwy9jU=;
        b=TZLPiT2WXB6m+VfDLIrtaoIAxKRa3Hd1z7WaPW9azjgrEuxxXOmvbChhQm5eINUvHN
         NgR3ygL//S3PhTh5Yu4iAfInZGXhWw6TxAWIgDCdOnWS6lsauCT8IQk7C3c1zabuWOd9
         imlL/NqVuiG4HjQ43r/olDShnpbMRjQVjMn5Bs84uUfR9QQ0piarDxULosQdutYXVajY
         94peP8lynF/llVrg+uSw23x+/rDQn4/qx0/t3Yq11FJKvp0TPU27BEzsevuYZ1Kg7UKR
         Ls288xmtjCO+HUhAR8jjQLOSfpzWG8oVVdS1GecRVMa3OYN9de1z39IOmsnW76wJAE9E
         AEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792134376; x=1792739176;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/2jqa+k0beoa2e8GpEXqYDpFzH47mftrDYLKkFwy9jU=;
        b=c4dT7VNsj5tGSMl48IBRYRMfpeT7nBrrPWTkliTTcJgo53WmuLZjyN2O0pKRqAS9p2
         Ru1jctrBH/wQ2ZQ1aCdtaZlantDyGCK3khFdJkbq+W0idajNaNHxp+gNELK0XWTv2YVy
         YFBTfBSQzv2iLVhGFuQjvzM2WGxoXG4BMEEGatSRoJUJKkG/OU1zyt7q9lAqsie2ugal
         RNzjRjmzMMG0sqxtlj2sjG9Y5RqPKFd18H9V0Mc5KzvTphTaJrL1OuTL7a4LmNYipqFD
         0lvcC/bysWNDNRqofcgX09CArCws28IFEBooZJzRZQQhLdu4JlCczm8iD62Q8vcoonph
         PVGw==
X-Forwarded-Encrypted: i=1; AKwUvBwgctz0XkgRhJkvVhSubA5z12dN7gS8BfZOo0V+WF6D4mMy7F+IjpOA/33Cy7NrE7HGveI+Sv86xTGddg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLET8Z3O0gbKxylwqbbR9tUHMhI0r/YCi0LHMoHX6sIZeNpqBJX
	QxbJ6VnBjeLKV8m4nOz6ZWxBxjLInds7XQoP/mOMmEViWbktM6uvB5hiYXj8NKjW/M5cAmtGlh7
	LpfvCxG/AmFrV4OVajHmm5rhQeboO1vw=
X-Gm-Gg: AYBFou0E+uNjAkH5ZxAFzzONya7shCnu6PDt2Z/SCsdGFxwcoyRiJyEH74sMa9tq0Lb
	m7jti1FsA0hhOC7YznX4vIF3mesa98S5zX+mTUaYBCB6SKhIAZpafUWURQrdLVsoJjddo/3+vxW
	N6TDq6H2DSGC6rJ+01c1lmKurcT5OWNk3y/GMblMqfmRgXhgOr/TCCkT87+IS/+kvXFfceTnjSF
	w9jiA5ItRZGvzMMfnk7xLUwlO42d8yKpIirxihK43fiz5i1w07MfoD+vQ++D6nDnFu0tEjWK96R
	1J1UK+SI9l9IbMttG0kDRliOv/xEgB7MTicH6wzb+0xT0dubXTIawVnK
X-Received: by 2002:a05:6512:3f2a:b0:5be:3d04:8e55 with SMTP id
 2adb3069b0e04-5be3d048fa6mr1475121e87.1.1792134375564; Fri, 16 Oct 2026
 00:06:15 -0700 (PDT)
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
 <CAPvUaSpPVYc-5M72G0Hf9JPsbdAp2-4f-p5OetYbMKdLqm0PXQ@mail.gmail.com> <atEh9Gon95EFIq76@archlinux>
In-Reply-To: <atEh9Gon95EFIq76@archlinux>
From: Lorenzo Collevecchio <lorenzocollevecchio17@gmail.com>
Date: Fri, 16 Oct 2026 09:06:03 +0200
X-Gm-Features: AclHuK8VdjQ70YPknGMoew2S60gMy5MYayOBGN4PST7XEU_GGQvcWJwMErei5-U
Message-ID: <CAPvUaSpq2d5hkxTaqAL6rBoeHct68Y37C4nSpV+goGZ-QwrCsw@mail.gmail.com>
Subject: Re: hp-wmi: WHCM AE_AML_OPERAND_TYPE and fan init -22 on HP OmniBook
 5 16-ag1xxx (board 8DF4)
To: Krishna Chomal <krishna.chomal108@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, W_Armin@gmx.de
Content-Type: text/plain; charset="UTF-8"

Subject: Re: hp-wmi: WHCM AE_AML_OPERAND_TYPE and fan init -22 on HP
OmniBook 5 16-ag1xxx (board 8DF4)

Hi Krishna,

Thanks a lot for digging into the ACPI code, the explanation makes
everything fit: the missing GMCF call for HPWMI_GM, Local2 being left
as an Integer, and the -22 coming from that.

I also tried your suggestion about the platform profile. With
HPWMI_READ/WRITE the errors should not appear:

  Before: dmesg | grep -c WHCM  ->  3 (the three boot-time errors)
  cat /sys/firmware/acpi/platform_profile  ->  quiet
  After:  dmesg | grep -c WHCM  ->  3 (no new errors)

On the fan: thanks for confirming that acpi_fan reads the EC value
correctly. Together with hearing the fan on Mint and on CachyOS at
idle, that makes me fairly comfortable that the 0 RPM readings are the
fan really being off.

Your plan to query the fan count and hide pwm1_enable and
fan{1,2}_input when it fails sounds good to me. I am happy to test it
on 8DF4 whenever you have a patch, and I can rebase it onto a stable
kernel tree on my side if that is easier for you.

I also tried 7.2.10-1-cachyos: dmesg and the hp-wmi hwmon folder are
identical to 7.2.9 (three WHCM errors, then the -22 message, and
pwm1_enable still present).

Thanks again for the time you spent on this.

Best regards,
Lorenzo

Il giorno gio 15 ott 2026 alle ore 21:58 Krishna Chomal
<krishna.chomal108@gmail.com> ha scritto:
>
> On Tue, Oct 13, 2026 at 11:32:49AM +0200, Lorenzo Collevecchio wrote:
> >Subject: Re: hp-wmi: WHCM AE_AML_OPERAND_TYPE and fan init -22 on HP
> >OmniBook 5 16-ag1xxx (board 8DF4)
> >
> >Hi Krishna,
> >
> >A follow-up with more data while you look at the previous results. No rush.
>
> Hi Lorenzo,
>
> Apologies for the delay in response, I took some time and had another
> look at your ACPI code, and the results make a lot more sense now.
>
> >1) Same board on Linux Mint 22.3 (live USB, kernel 6.14.0-37-generic,
> >ACPICA 20240827), board 8DF4, BIOS F.12:
> >  - WHCM aborts with AE_AML_OPERAND_TYPE twice at boot (11.7 s and
> >11.9 s), the same error as on 7.2.9. The ACPI thermal warnings are
> >identical (invalid critical threshold -274000, no valid trip points).
> >  - "Failed to apply initial fan settings" is not printed.
> >/sys/devices/platform/hp-wmi/hwmon/ contains name, power, pwm1_enable,
> >subsystem, uevent, so there is again a pwm1_enable and nothing else.
>
> Fan control was not added in v6.14, so it makes sense that the string is
> not being logged.
>
> >  - hp_bioscfg was not loaded and there are no WQBC/WQBE errors,
> >consistent with the blacklist result I sent earlier.
> >  - The hwmon list has no fan sensor at all (ACAD, acpitz, BAT1, nvme,
> >ucsi, k10temp, hp, amdgpu), whereas CachyOS has acpi_fan with
> >fan1_input.
> >  - With a 2-core load the CPU went from 37 C to 80 C in about 23
> >seconds and I could hear the fan running, so the firmware starts the
> >fan on this hardware without any help from hp-wmi.
>
> This is a good sign that the firmware (and obviously the hardware) is
> working fine.
>
> >2) Fan behaviour on CachyOS 7.2.9 (stock hp-wmi, acpi_fan fan1_input,
> >Fan Always On disabled):
> >  - Idle, CPU about 30-40 C, on AC and after unplugging: fan audible
> >and fan1_input steady at about 2300 RPM for several minutes. Then it
> >dropped to 0 RPM by itself at about 39 C. Earlier, during a light
> >game, it showed about 2400 RPM at 50-55 C. I have never seen an
> >intermediate value, only about 2300-2400 or 0.
>
> This is perfectly reasonable. I observe similar jump in fan speeds on my
> device as well.
>
> >  - Short stress-ng bursts (boost on): 46 -> 80 C in 18 s and 37 -> 73
> >C in about 35 s, with fan1_input at 0 for every sample.  Fan was off
> >during this stress test.
> >
> >So the fan state does not seem to follow CPU temperature alone: it ran
> >at 30 C while idle, first plugged in and then after unplugging, and
> >did not read as running at 70-80 C during short bursts. I do not know
> >what else the firmware looks at.
>
> I am sorry but I don't really have an answer for this. All I can say is
> whatever the firmware is doing, it should be same in Windows and Linux.
>
> >Questions:
> >  - Is the acpi_fan reading of 0 RPM trustworthy on this firmware (is
> >_FST implemented properly), or could it be reporting 0 while the fan
> >runs?
>
> I think you can give the most accurate answer here with physical
> testing, but from what I can see, it looks like it acpi_fan is wired
> correctly, it reads the 1-byte RPM state from EC (and multiplies by 100
> to get the true RPM):
>
>              Method (_FST, 0, NotSerialized)  // _FST: Fan Status
>              {
>                  TFST [0x02] = (\_SB.PCI0.LPC0.EC0.F1SP * 0x64)
>                  Return (TFST) /* \_SB_.FAN0.TFST */
>              }
>
> >  - Does anything in the DSDT/EC code suggest what drives the fan
> >decision (battery, charging, a timer)?
>
> I can't seem to find anything, but will be glad to know if someone else
> can enlighten me here.
>
> >Happy to test any patch and to send more logs.
> >
> >Thanks,
> >Lorenzo
> >
> >Il giorno lun 12 ott 2026 alle ore 21:34 Lorenzo Collevecchio
> ><lorenzocollevecchio17@gmail.com> ha scritto:
> >>
> >> Subject: Re: hp-wmi: WHCM AE_AML_OPERAND_TYPE and fan init -22 on HP
> >> OmniBook 5 16-ag1xxx (board 8DF4)
> >>
> >> Hi Krishna,
> >>
> >> No problem, thanks for the revised patch.
> >>
> >> Base: stable v7.2.9 (drivers/platform/x86/hp/hp-wmi.c), built out of
> >> tree against 7.2.9-2-cachyos. I applied your three hunks by hand,
> >> because the context in my tree differs (my hp_wmi_hwmon_is_visible()
> >> uses is_victus_s_thermal_profile()). The resulting hp_wmi_hwmon_init()
> >> has the same structure as your diff: hwmon registration first, then
> >> fan_count with the pr_info, then the early return before
> >> hp_wmi_setup_fan_settings().
> >>
> >> Test: normal boot (hp_bioscfg loaded), rmmod hp_wmi, insmod the
> >> patched module. dmesg after the reload:
> >>
> >> [  318.615352] hp_wmi: loading out-of-tree module taints kernel.
> >> [  319.235086] input: HP WMI hotkeys as /devices/virtual/input/input27
> >> [  319.646490] ACPI Error: Aborting method \_SB.WMID.WHCM due to
> >> previous error (AE_AML_OPERAND_TYPE)
> >> [  319.646528] hp_wmi: channel = 0 | fan_speed = -22
> >> [  319.851354] ACPI Error: Aborting method \_SB.WMID.WHCM due to
> >> previous error (AE_AML_OPERAND_TYPE)
> >> [  319.851395] hp_wmi: channel = 1 | fan_speed = -22
> >> [  320.056884] ACPI Error: Aborting method \_SB.WMID.WHCM due to
> >> previous error (AE_AML_OPERAND_TYPE)
> >> [  320.262561] ACPI Error: Aborting method \_SB.WMID.WHCM due to
> >> previous error (AE_AML_OPERAND_TYPE)
> >> [  320.466854] ACPI Error: Aborting method \_SB.WMID.WHCM due to
> >> previous error (AE_AML_OPERAND_TYPE)
> >> [  320.466894] hp_wmi: fan_count = -22
> >> [  320.878745] hp_wmi: Registered as platform profile handler
> >>
> >> hwmon folder: contains only device, name, power, subsystem, uevent. No
> >> pwm1_enable, and no fan*_input.
> >>
> >> So:
> >>   - The hwmon device is registered and pwm1_enable is hidden, as you expected.
> >>   - "Failed to apply initial fan settings: -22" is no longer printed.
> >>   - fan1_input/fan2_input are not visible because
> >> hp_wmi_get_fan_speed() returns -22 for both channels, not 0. Each of
> >> these queries (fan speed per channel, and fan count) ends in a WHCM
> >> abort with AE_AML_OPERAND_TYPE, so no result buffer is returned at
> >> all, rather than a stub all-zero one.
> >>   - fan_count is also -22, which is why the early return is taken.
> >>
> >> I wonder whether the AML error depends on what the driver passes in:
> >> the error says Index() found an Integer where it needs a
> >> Buffer/String/Package. Does it look to you as if WHCM expects a
> >> different argument layout than the driver sends for these queries? I
> >> can test any variant.
>
> Yes, so here is what I found. All HPWMI_GM (command 0x20008) queries go
> through WHCM, but the relevant switch-case does not call its dispatcher:
>
>                          Case (0x00020008)
>                          {
>                              RTCD = RTCC /* \_SB_.WMID.RTCC */
>                          }
>
> Notice how it simply assigns RTCD, but does not call method GMCF. GMCF
> is the universal dispatcher responsible for calling the appropriate
> methods:
>
>              Method (GMCF, 2, Serialized)
>              {
>                  Switch (Arg0)
>                  {
>                      Case (One)
>                      {
>                          RTCC = Zero
>                          Return (GC01 ())
>                      }
>                     ...
>
> This explains why despite stub methods being present, are not called,
> and instead we get -22 (-EINVAL) as response.
>
> Now about the AE_AML_OPERAND_TYPE error, in WHCM, if we see other
> branches like HPWMI_READ:
>
>                          Case (One)
>                          {
>                              If (((CMTP > Zero) && (CMTP <= 0x5C)))
>                              {
>                                  If ((DASI < DerefOf (RCDS [(CMTP - One)])))
>                                  {
>                                      RTCD = 0x05
>                                  }
>                                  Else
>                                  {
>                                      Local2 = RDCF (CMTP, Arg1)
>                                      RTCD = RTCC /* \_SB_.WMID.RTCC */
>                                  }
>                              }
>                          }
>
> It assigns the response buffer object to Local2. This assignment from
> the dispatcher is missing in case of HPWMI_GM queries. Later on, Local2
> is being dereferenced:
>
>                      RTCD = DerefOf (Local2 [Zero])
>                      If ((RTCD == Zero))
>                      {
>                          If ((DerefOf (Local2 [One]) <= Local0))
>                          {
>                              Local0 = Zero
>                              While ((Local0 < DerefOf (Local2 [One])))
>                             ...
>
> Which is usually fine, but when Local2 is undefined (as in case of
> HPWMI_GM) it defaults to an Integer, which obviously cannot be
> dereferenced, and must be responsible for AE_AML_OPERAND_TYPE.
>
> TL;DR: ACPI code looks broken, not something I can fix from the driver
> side. What I can (and probably should) do is, query for fan count (or
> something similar) and conditionally disabled fan control (pwm1_enable,
> fan{1,2}_input), that would likely stop the hwmon polling spam in dmesg.
>
> PS: HPWMI_READ/HPWMI_WRITE commands are still valid. You should be able
> to confirm this by, for example, reading thermal profile
> (cat /sys/firmware/acpi/platform_profile) and AE_AML_OPERAND_TYPE errors
> should not appear in dmesg.
>
> PPS: If you are interested in the correct firmware, you can see the
> acpidump attached in this[1] bugzilla issue. I am pasting diff of WHCM
> for your reference.
>
> diff --git a/8DF4 b/8D9C
> index 8aff2cd..f493551 100644
> --- a/8DF4
> +++ b/8D9C
> @@ -44,11 +44,6 @@
>                   {
>                       RTCD = 0x03
>                       RTCC = Zero
> -                    Sleep (0x32)
> -                    Sleep (0x32)
> -                    Sleep (0x32)
> -                    Sleep (0x32)
> -                    \_SB.PCI0.LPC0.EC0.WMIS = One
>                       Switch (COMD)
>                       {
>                           Case (One)
> @@ -83,24 +78,35 @@
>                           }
>                           Case (0x00020008)
>                           {
> +                            Local2 = GMCF (CMTP, Arg1)
>                               RTCD = RTCC /* \_SB_.WMID.RTCC */
>                           }
>                           Case (0x00020009)
>                           {
> +                            Local2 = LDCF (CMTP, Arg1)
>                               RTCD = RTCC /* \_SB_.WMID.RTCC */
>                           }
> -                        Case (0x0002000B)
> +                        Case (0x03)
>                           {
> -                            Switch (CMTP)
> +                            RTCD = 0x04
> +                            If (((CMTP > Zero) && (CMTP <= One)))
>                               {
> -                                Case (One)
> +                                If ((DASI < DerefOf (ODSZ [(CMTP - One)])))
> +                                {
> +                                    RTCD = 0x05
> +                                }
> +                                ElseIf ((CMTP == One))
>                                   {
> -                                    Local2 = RUCM ()
> +                                    Local2 = \HODW (Arg1)
>                                       RTCD = Zero
>                                   }
> -
>                               }
>                           }
> +                        Case (0x0002000B)
> +                        {
> +                            Local2 = \TYPC (Arg1)
> +                            RTCD = Zero
> +                        }
>
>                       }
>                   }
>
> [1]: https://bugzilla.kernel.org/show_bug.cgi?id=222107
>
> >> Happy to test further patches.
> >>
> >> Thanks,
> >> Lorenzo
> >>
> >> Il giorno lun 12 ott 2026 alle ore 19:49 Krishna Chomal
> >> <krishna.chomal108@gmail.com> ha scritto:
> >> >
> >> > On Mon, Oct 12, 2026 at 06:04:37PM +0200, Lorenzo Collevecchio wrote:
> >> > >Subject: Re: hp-wmi: WHCM AE_AML_OPERAND_TYPE and fan init -22 on HP
> >> > >OmniBook 5 16-ag1xxx (board 8DF4)
> >> > >
> >> > >Hi Krishna,
> >> > >
> >> > >Thanks for the patch. Results below.
> >> > >
> >> > >Base and adaptation:
> >> > >I used drivers/platform/x86/hp/hp-wmi.c from stable v7.2.9, built out
> >> > >of tree against 7.2.9-2-cachyos. Your diff did not apply cleanly: hunk
> >> > >1 failed, because my hp_wmi_hwmon_is_visible() uses
> >> > >is_victus_s_thermal_profile() and hp_wmi_get_fan_speed_victus_s()
> >> > >rather than the helpers in your context lines. Hunks 2 and 3 applied
> >> > >with offsets of about -230 lines. So I made these changes by hand:
> >> > >  - declared int fan_speed in hp_wmi_hwmon_is_visible()
> >> > >  - added your pr_info() and the fan_speed variable in the non-Victus
> >> > >hwmon_fan branch
> >> > >  - added the fan_count <= 0 early return in hp_wmi_hwmon_init()
> >> > >I did NOT add the hwmon_pwm_enable check in is_visible(), since the
> >> > >early return in init already prevents hwmon registration. If you want
> >> > >me to test against a different tree, tell me which one.
> >> > >
> >> > >Test: normal boot (hp_bioscfg not blacklisted), then rmmod hp_wmi and
> >> > >insmod the patched module. Output of dmesg | grep -i -E
> >> > >"hp.wmi|WHCM|WQB|fan", showing the stock boot first and then the
> >> > >reload at about 5156 s:
> >> > >
> >> > >[    6.453093] ACPI Error: Aborting method \_SB.WMID.WHCM ...
> >> > >(AE_AML_OPERAND_TYPE)
> >> > >[    6.655089] ACPI Error: Aborting method \_SB.WMID.WHCM ...
> >> > >(AE_AML_OPERAND_TYPE)
> >> > >[    6.857553] ACPI Error: Aborting method \_SB.WMID.WHCM ...
> >> > >(AE_AML_OPERAND_TYPE)
> >> > >[    6.857581] hp-wmi hp-wmi: Failed to apply initial fan settings: -22
> >> > >[    7.262812] hp_wmi: Registered as platform profile handler
> >> > >[    7.308567] ACPI Error: Aborting method \_SB.WMID.WQBC ...
> >> > >(AE_AML_OPERAND_VALUE)
> >> > >[    7.309182] ACPI Error: Aborting method \_SB.WMID.WQBE ...
> >> > >(AE_AML_OPERAND_VALUE)
> >> > >[ 5156.582212] hp_wmi: loading out-of-tree module taints kernel.
> >> > >[ 5156.582224] hp_wmi: module verification failed: signature and/or
> >> > >required key missing - tainting kernel
> >> > >[ 5157.203181] input: HP WMI hotkeys as /devices/virtual/input/input27
> >> > >[ 5157.614765] ACPI Error: Aborting method \_SB.WMID.WHCM ...
> >> > >(AE_AML_OPERAND_TYPE)
> >> > >[ 5158.026462] hp_wmi: Registered as platform profile handler
> >> > >
> >> > >What I see with the patched module:
> >> > >  - "Failed to apply initial fan settings: -22" is gone.
> >> > >  - /sys/devices/platform/hp-wmi/hwmon/ does not exist any more, so
> >> > >pwm1_enable is hidden as you expected.
> >> > >  - Only one WHCM error is logged after the reload instead of three. I
> >> > >do not know which call produces it; I am guessing it is the fan count
> >> > >query.
> >> > >  - No "channel = ... | fan_speed = ..." lines appear, because no
> >> > >hwmon device is registered once fan_count <= 0, so is_visible() never
> >> > >runs. If you want to see the fan speed query result, the print would
> >> > >have to go somewhere that runs in this case. I can test a modified
> >> > >patch.
> >> > >  - WQBC/WQBE do not appear in the reload because only hp_wmi was
> >> > >reloaded (hp_bioscfg stayed loaded).
> >> > >  - The platform profile still registers with quiet balanced performance.
> >> > >
> >> > >Fan Always On in the BIOS was off during all my tests.
> >> > >
> >> > >Fan behaviour, in case it is useful: on a cold boot with a 2-core
> >> > >stress-ng load, the CPU went from 46 C to 80 C in about 18 seconds
> >> > >while acpi_fan fan1_input stayed at 0 RPM (Fan Always On off). I
> >> > >stopped the test at 80 C. I can send the full log, and I can retest
> >> > >with Fan Always On enabled if you want.
> >> > >
> >> > >Happy to test further patches.
> >> >
> >> > My fault, sorry. I should have clarified earlier that my patch was
> >> > based off of pdx86 tree[1] (master branch). Regarding the patch yes,
> >> > by mistake I ended up disabling the whole hwmon device (not what we
> >> > want). Let's register the hwmon device first then later handle the fan
> >> > logic optionally with the count guards.
> >> >
> >> > Now hwmon should be available but pwm1_enable will be hidden. Also,
> >> > fan{1,2}_input is expected to be visible, I am not sure why it isn't
> >> > showing up for your device.
> >> >
> >> > (as usual, rest all errors would be same)
> >> >
> >> > diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> >> > index b2773fc1aca4..422d65d5c514 100644
> >> > --- a/drivers/platform/x86/hp/hp-wmi.c
> >> > +++ b/drivers/platform/x86/hp/hp-wmi.c
> >> > @@ -2679,8 +2679,14 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
> >> >                                        enum hwmon_sensor_types type,
> >> >                                        u32 attr, int channel)
> >> >   {
> >> > +       int fan_count;
> >> > +       int fan_speed;
> >> > +
> >> >         switch (type) {
> >> >         case hwmon_pwm:
> >> > +               fan_count = hp_wmi_get_fan_count_userdefine_trigger();
> >> > +               if (attr == hwmon_pwm_enable && fan_count <= 0)
> >> > +                       return 0;
> >> >                 if (attr == hwmon_pwm_input && !hp_wmi_fan_control_supported())
> >> >                         return 0;
> >> >                 return 0644;
> >> > @@ -2689,7 +2695,9 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
> >> >                         if (hp_wmi_get_active_fan_speed(channel) >= 0)
> >> >                                 return 0444;
> >> >                 } else {
> >> > -                       if (hp_wmi_get_fan_speed(channel) >= 0)
> >> > +                       fan_speed = hp_wmi_get_fan_speed(channel);
> >> > +                       pr_info("channel = %d | fan_speed = %d\n", channel, fan_speed);
> >> > +                       if (fan_speed >= 0)
> >> >                                 return 0444;
> >> >                 }
> >> >                 break;
> >> > @@ -2905,6 +2913,7 @@ static int hp_wmi_hwmon_init(void)
> >> >         struct device *dev = &hp_wmi_platform_dev->dev;
> >> >         struct hp_wmi_hwmon_priv *priv;
> >> >         struct device *hwmon;
> >> > +       int fan_count;
> >> >         int ret;
> >> >
> >> >         priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> >> > @@ -2915,11 +2924,17 @@ static int hp_wmi_hwmon_init(void)
> >> >         if (ret)
> >> >                 return ret;
> >> >
> >> > +       hwmon = devm_hwmon_device_register_with_info(dev, "hp", priv,
> >> > +                                                    &chip_info, NULL);
> >> > +
> >> > +       fan_count = hp_wmi_get_fan_count_userdefine_trigger();
> >> > +       pr_info("fan_count = %d\n", fan_count);
> >> > +       if (fan_count <= 0)
> >> > +               return 0;
> >> > +
> >> >         ret = hp_wmi_setup_fan_settings(priv);
> >> >         if (ret)
> >> >                 return ret;
> >> > -       hwmon = devm_hwmon_device_register_with_info(dev, "hp", priv,
> >> > -                                                    &chip_info, NULL);
> >> >
> >> >         if (IS_ERR(hwmon)) {
> >> >                 dev_err(dev, "Could not register hp hwmon device\n");
> >> >
> >> > [1]: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
> >> >
> >> > >Thanks,
> >> > >Lorenzo
> >> > >
> >> > >Il giorno lun 12 ott 2026 alle ore 17:24 Krishna Chomal
> >> > ><krishna.chomal108@gmail.com> ha scritto:
> >> > >>
> >> > >> On Mon, Oct 12, 2026 at 10:08:43AM +0200, Lorenzo Collevecchio wrote:
> >> > >> >Hi Armin, Krishna,
> >> > >> >
> >> > >> >Thanks for the quick replies.
> >> > >> >
> >> > >> >acpidump:
> >> > >> >https://gist.github.com/CollevecchioLorenzo/aef5917d9775629d48618bd42cb5f5e2
> >> > >> >
> >> > >> >I booted 7.2.9-2-cachyos with modprobe.blacklist=hp_bioscfg
> >> > >> >(confirmed in /proc/cmdline; hp_bioscfg is not loaded). Counts of
> >> > >> >each message in dmesg, before and after:
> >> > >> >
> >> > >> >  WHCM AE_AML_OPERAND_TYPE:                 3 before, 3 after
> >> > >> >  "Failed to apply initial fan settings: -22": 1 before, 1 after
> >> > >> >  WQBC / WQBE AE_AML_OPERAND_VALUE:         1/1 before, 0/0 after
> >> > >> >
> >> > >> >So the WQBC/WQBE errors come from hp_bioscfg, as you suspected. The
> >> > >> >WHCM errors and the -22 are not caused by it: they still occur with
> >> > >> >hp_bioscfg blacklisted, right before "hp_wmi: Registered as platform
> >> > >> >profile handler".
> >> > >> >
> >> > >> >Windows, as you asked (Krishna):
> >> > >> >- The Windows power mode setting exists, but that is standard
> >> > >> >  Windows, i didn't check for HP specific.
> >> > >> >- Omen Gaming Hub offers a performance mode
> >> > >> >  option on this laptop.
> >> > >>
> >> > >> Interesting, what choices does it offer you? Eco/Balanced/Performance?
> >> > >> Or something else?
> >> > >>
> >> > >> >- The BIOS has a "Fan Always On" setting. I had it turned off
> >> > >> >
> >> > >> >Happy to test any patch or run further commands.
> >> > >>
> >> > >> Can you apply the following diff and share the output of:
> >> > >> # dmesg | grep "hp_wmi"
> >> > >>
> >> > >> Expected results:
> >> > >> - No "failed to apply initial fan settings: -22" in dmesg
> >> > >> - pwm1_enable should be hidden
> >> > >>
> >> > >> Note:
> >> > >> - I have also added a debug print to get fan speed query result. From your
> >> > >>    acpidump, it looks like a stub implementation returning all zeros buffer
> >> > >>    (0 RPM) which should have made fan{1,2}_input visible but it's interesting
> >> > >>    that it isn't visible; the dmesg log should help us gain more insight.
> >> > >> - All other errors in dmesg may (will) be same, as this patch isn't
> >> > >>    intended to solve them.
> >> > >>
> >> > >> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> >> > >> index 3ec6047c0f89..ee51790549ed 100644
> >> > >> --- a/drivers/platform/x86/hp/hp-wmi.c
> >> > >> +++ b/drivers/platform/x86/hp/hp-wmi.c
> >> > >> @@ -2705,8 +2705,14 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
> >> > >>                                        enum hwmon_sensor_types type,
> >> > >>                                        u32 attr, int channel)
> >> > >>   {
> >> > >> +       int fan_count;
> >> > >> +       int fan_speed;
> >> > >> +
> >> > >>         switch (type) {
> >> > >>         case hwmon_pwm:
> >> > >> +               fan_count = hp_wmi_get_fan_count_userdefine_trigger();
> >> > >> +               if (attr == hwmon_pwm_enable && fan_count <= 0)
> >> > >> +                       return 0;
> >> > >>                 if (attr == hwmon_pwm_input && !hp_wmi_fan_control_supported())
> >> > >>                         return 0;
> >> > >>                 return 0644;
> >> > >> @@ -2715,7 +2721,9 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
> >> > >>                         if (hp_wmi_get_active_fan_speed(channel) >= 0)
> >> > >>                                 return 0444;
> >> > >>                 } else {
> >> > >> -                       if (hp_wmi_get_fan_speed(channel) >= 0)
> >> > >> +                       fan_speed = hp_wmi_get_fan_speed(channel);
> >> > >> +                       pr_info("channel = %d | fan_speed = %d\n", channel, fan_speed);
> >> > >> +                       if (fan_speed >= 0)
> >> > >>                                 return 0444;
> >> > >>                 }
> >> > >>                 break;
> >> > >> @@ -2931,8 +2939,13 @@ static int hp_wmi_hwmon_init(void)
> >> > >>         struct device *dev = &hp_wmi_platform_dev->dev;
> >> > >>         struct hp_wmi_hwmon_priv *priv;
> >> > >>         struct device *hwmon;
> >> > >> +       int fan_count;
> >> > >>         int ret;
> >> > >>
> >> > >> +       fan_count = hp_wmi_get_fan_count_userdefine_trigger();
> >> > >> +       if (fan_count <= 0)
> >> > >> +               return 0;
> >> > >> +
> >> > >>         priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> >> > >>         if (!priv)
> >> > >>                 return -ENOMEM;
> >> > >>
> >> > >>
> >> > >> >Thanks,
> >> > >> >Lorenzo
> >> > >> >
> >> > >> >
> >> > >> >
> >> > >> >
> >> > >> >Il giorno lun 12 ott 2026 alle ore 06:03 Krishna Chomal
> >> > >> ><krishna.chomal108@gmail.com> ha scritto:
> >> > >> >>
> >> > >> >> +Armin Wolf
> >> > >> >>
> >> > >> >> On Sun, Oct 11, 2026 at 06:03:25PM +0200, Lorenzo Collevecchio wrote:
> >> > >> >> >Hello,
> >> > >> >> >
> >> > >> >> >I am seeing hp-wmi fan interface failures on an HP OmniBook 5
> >> > >> >> >16-ag1xxx. This is not a gaming model.
> >> > >> >>
> >> > >> >> Hi Lorenzo,
> >> > >> >>
> >> > >> >> Thanks for reporting.
> >> > >> >>
> >> > >> >> >Hardware:
> >> > >> >> >  product_name: HP OmniBook 5 Laptop 16-ag1xxx (16-AG1002SL)
> >> > >> >> >  board_name:   8DF4
> >> > >> >> >  BIOS:         F.12, 04/10/2026 (no newer firmware listed on LVFS for
> >> > >> >> >this machine)
> >> > >> >> >  Kernel:       7.2.9-2-cachyos (also tested 6.18.55-2-cachyos-lts;
> >> > >> >> >ACPICA 20250807 vs 20260408)
> >> > >> >> >
> >> > >> >> >Symptoms:
> >> > >> >> >1. At boot, \_SB.WMID.WHCM (called via WMAA) fails three times with
> >> > >> >> >   "AE_AML_OPERAND_TYPE: Needed [Buffer/String/Package], found
> >> > >> >> >[Integer]" while resolving operands for [Index].
> >> > >> >>
> >> > >> >> This is likely due to hp-bioscfg instead of hp-wmi.
> >> > >> >>
> >> > >> >> >2. Immediately afterwards: "hp-wmi hp-wmi: Failed to apply initial fan
> >> > >> >> >settings: -22".
> >> > >> >>
> >> > >> >> Ah yes! This is because we are currently enabling fan control for ALL
> >> > >> >> devices. If you share your acpidump, I can check if we should use the
> >> > >> >> HPWMI_FAN_COUNT_GET_QUERY to decide whether to allow pwm1_enable or not.
> >> > >> >>
> >> > >> >> >3. Later: "Attempt to CreateField of length zero" in \_SB.WMID.WQBC
> >> > >> >> >and WQBE (AE_AML_OPERAND_VALUE).
> >> > >> >>
> >> > >> >> This is also likely due to hp-bioscfg. Try booting with kernel cmdline
> >> > >> >> parameter "modprobe.blacklist=hp_bioscfg" and see if these disappear.
> >> > >> >> That will help us narrow down the scope. But in any case, I think Armin
> >> > >> >> Wolf will have to help here since I am not familiar with bioscfg anyway.
> >> > >> >>
> >> > >> >> >4. hp_wmi still registers as a platform profile handler (quiet
> >> > >> >> >balanced performance).
> >> > >> >>
> >> > >> >> This is because 8DF4 is not present in any whitelists, so it takes a
> >> > >> >> fallback path and uses legacy WMI queries. Honestly, I am not sure if
> >> > >> >> platform profile should be registered for OmniBook devices. Could you
> >> > >> >> let me know if Omen Gaming Hub on Windows allows you to switch
> >> > >> >> performance modes or there is no option for this?
> >> > >> >>
> >> > >> >> >5. /sys/devices/platform/hp-wmi/hwmon/*/ contains only pwm1_enable
> >> > >> >> >(rw); there is no pwm1 and no fan1_input.
> >> > >> >>
> >> > >> >> Intended.
> >> > >> >>
> >> > >> >> * pwm1_enable - As said, this is because we are currently (incorrectly)
> >> > >> >>                  enabling fan control for all devices.
> >> > >> >> * pwm1 - Absent because manual fan control must be unavailable on this
> >> > >> >>           board.
> >> > >> >> * fan1_input - Absent because get fan speed query must be failing.
> >> > >> >>
> >> > >> >> >6. On the LTS kernel the same WHCM error repeats about every 2.2 s
> >> > >> >> >while something polls the hp hwmon device (277 times between 551 s and
> >> > >> >> >1165 s uptime).
> >> > >> >> >7. ACPI thermal: "Invalid critical threshold (-274000)" and "No valid
> >> > >> >> >trip points!" for thermal zone TSZ0.
> >> > >> >> >
> >> > >> >> >Fan behaviour:
> >> > >> >> >- acpi_fan (acpi-fan PNP0C0B, "Using Microsoft fan extensions")
> >> > >> >> >exposes fan1_input. It sometimes shows about 2400 RPM and sometimes 0
> >> > >> >> >RPM.
> >> > >> >> >- The fan works normally under Windows on the same machine.
> >> > >> >> >- I once saw the CPU around 95 C with the fan apparently stopped on
> >> > >> >> >Linux; I have not been able to reproduce it yet and am collecting a
> >> > >> >> >temperature/RPM log.
> >> > >> >> >
> >> > >> >> >I suspect the WMI query path the driver uses for fan settings is not
> >> > >> >> >implemented by this firmware, so hp-wmi should probably not attempt it
> >> > >> >> >on board 8DF4. I would be glad to test patches or provide acpidump
> >> > >> >> >output, WMI GUID listings or any other data.
> >> > >> >>
> >> > >> >> acpidump would be helpful.
> >> > >> >>
> >> > >> >> Thanks,
> >> > >> >> Krishna
> >> > >> >>
> >> > >> >> >Thanks,
> >> > >> >> >Lorenzo
