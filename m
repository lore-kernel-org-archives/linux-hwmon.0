Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35AC3BE64B
	for <linux-hwmon@vger.kernel.org>; Mon, 12 Oct 2026 08:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791792540; cv=pass; b=Oy4s/pu7czRIGuHt5IgLu/VDMRZ4EUD5HmgaOqR0P6fFWUE2RzRk0JULVkyQIDiYm6n0GQRdZnR758/KjTiwOHjyTGAPppLguqZ45HHrdpM1M5l9fojYp5yhTJveCSWz9uckZUmBvmsEPrqKs0WP3flyjx/FxFBkeOljKofpLck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791792540; c=relaxed/simple;
	bh=9s3mrYJ7+5SgZM2v5YsLEH8BsKpU23j+dxsH+EwUIBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k/bVhus70cNUniyrmX5+P8f2Fn3rzQ5aZDu+dfqcL69ElstvantH/21ByVWOaVKgKwhGIL5UqWNM8AHwa04dZRvCi91Bs1z8XXB1c8oGNDzYqKwrT/hLbB4RnDxZkqidCv3gma/vsMO+SYoegMI+lSoufGA6WE/mpEcdDYowqGA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cbp0jgyg; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cbp0jgyg"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a81c6ceed2so2400921fa.1
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Oct 2026 01:08:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791792537; cv=none;
        d=google.com; s=arc-20260327;
        b=QrCNPTsSenB24scDNiwEqSRNUs96yB7vumCLajkGkPvnsJn2lH/VEsejtUTx4/Kcgh
         OZsaMrEzZ06Oa/dcguKyigb7vpnd2Hgg86+ikjyvTKqztrlHttuYoISqw9kQACceCPuJ
         Ec0twcQXdSrw1zs6xtLs+ZvzIopiDft+8j7TfCBlcgxCYa66XiVuTtueA5ucjR17T4kn
         RCU6oQxw+Zl4gEBgeWy2GVyggGxEQhFoMtaKR3ZsPiAwlRUzKRYZIt2jr+mNS/Bfp9xg
         nhPxwsjzHjpkPiPCkdE8jEYnf24knxrEzQe99PbLjq+ZeZomyWd/qP3plOSQ6fwg7PDl
         TGvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/Bid3bokAT8GtDHUcm91fXQib8AjiPPpst1kvF9OlyE=;
        fh=56IIaQpDYXxGRdbz7wElbsR+ObMJICEXt4VWzgIrTBs=;
        b=QKKqFnF3/Fn89GLrcbcwVOHey9nKXEr9j4Oc+aKe8aLyCWq+At2Gm+REPeBH4twvUE
         IeT/32PHI+yROMsEOsN7wOJzW62YZ2NhkCKoCkc+5wDaJZMpTPVcXmW0X2no7/dDfZRQ
         6gODfxsv66h9Q4vCBy76qCv5Apb1u38ox/iNMPekAq5tDLP5RdJRsaaDMr2ZRn2LLpZ/
         VBg9+Ovi4s/dOKepsbPbLV0JVCuz/hjIYZS2/rQ7Oh4gdFMmCPMSuaaqfPGWWph9rLfj
         sYPwsP/xtjivLd9OIEolz3k9xo/VcLdHzsHXHUvc4qQnmw1xGThOcwazyVMpg2y3wuSs
         pvMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791792537; x=1792397337; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Bid3bokAT8GtDHUcm91fXQib8AjiPPpst1kvF9OlyE=;
        b=cbp0jgyg/Eti/YMH0nvU0ckfTxbzFBKYSKz9i7k4qjRTyiIut8QNojj2wiYeW0MAAh
         AQIj4mNWZjimwfAvKB9aSa4ipT2eXOnjWVZXdmre8r32ktR3lnNBcZL1rbzPhWEdslvW
         byxAYmo4PXgrYWFGLCzBOd/Fpg50oyuqLSTUKckJSUmCTc3VuyM8fs8q2k+pNrDV59M1
         ErawgYWwNw8uAEyrvCpi0CKO1RWmaMH89vLBy87HqLxuIqg187oyg0qlxN52nUsj9Eov
         KLpaHQ4CzSJg2epdwVi3fx6dpUANIKw/eVOYcBFqVTfK0BD2BEc9c2v+oAnDsObiOUK1
         axrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791792537; x=1792397337;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/Bid3bokAT8GtDHUcm91fXQib8AjiPPpst1kvF9OlyE=;
        b=iwR8+EKJbjFnhLdVh51MBMYnVuKLeBlgKU9wCLnqr89WEp0FzGO8dB9t5RXRQrBTwh
         yT+nB0l1yA5UrpJuHzf4US1gIZl1ZzjikS3VX+HC0wjG65Nr7wWS0Y7+56H1/f5TWzIY
         Scf+HLJILhdRqM3czkMsz88eTtNwST46niRuQB6q7o8wcFjo6B3N6cnJOq31BDfwno9W
         g6A4mQ62GVJQqtH2AtjGQCnc6n1SAFwQUyjFd98G4J8as6UDCQYHS/53xWat+1AQB4q8
         fGkDpRDFO9ljRFelypa97PTbRqS6oZeEWa2c3tC/363jQzwukDlc0rouX/nsVN77B7Wz
         PyUg==
X-Forwarded-Encrypted: i=1; AKwUvByEpgNYuuxddGi21pDBkSPK/awp5amC1QJOV3CvfOVLdHUIorA04NGVYrTt+K8MeTcNkBMPl+Lnfiz+vA==@vger.kernel.org
X-Gm-Message-State: AFq9FYK3VJ/XNKDtEfwpAF7lOTDqJvYPrsRDXoSsDgPZysL2GvO1JAeF
	xhcRNWIxaEzmie2a8YOUPPGaJHZFxPFNZXxLy0ZODV1jObPx8QRl9qttqCe6vklbJZrNTU5mg1v
	YLV2YQeqQ+c5NnhWMsNtZfL2VS1N960kwkh1fsKKkHA==
X-Gm-Gg: AYBFou2cr2DHBhshGhvCt4cMzLX6Eh7AQyPYzyQi1TL9ks/yNXQC56TxI4cdXnrJIoK
	gmPafR2P6z5vyjpczYACp/mGGTUGijq5Tdy5Q4ERQwXJIjxhJ4Y0b32rPHNkbTZDoawd1Ow0jAz
	T6s5qR62eT3Ojt2lNL3KgK5JgQlf2DwZ3CY+chXbft+w+CyOhIcHSn8aYSwtB9v6OBk1p5qAFj5
	R1FvpcEtF66odRYRbShwAxzEJ7qjp/vOWe3OeJz3Fg8bsjN28ww4NnQ0Krc4qmmSABODimCGcDe
	vgNJCcR+0ItBOilpsgMUGLrVKy2nTvIErbffTNN57RJ03JwG1OkwxekhUKnPBF282NNff1pv2L+
	g3GG15XjPcBur
X-Received: by 2002:a05:651c:3605:b0:3a5:cee6:9439 with SMTP id
 38308e7fff4ca-3a9c4850930mr20579991fa.0.1791792535033; Mon, 12 Oct 2026
 01:08:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPvUaSo1D+1Tvk3-4TMiXw-ScBtY8Mu0FzO7R_EG6zrjYfjYqg@mail.gmail.com>
 <asxTYBiGy6lf6-Ki@archlinux>
In-Reply-To: <asxTYBiGy6lf6-Ki@archlinux>
From: Lorenzo Collevecchio <lorenzocollevecchio17@gmail.com>
Date: Mon, 12 Oct 2026 10:08:43 +0200
X-Gm-Features: AclHuK9QIm_cyAxCJbd_dL0bCv_1RDgkPqpwV7qsRDi6PUx5VbyZNkuR62_tvDc
Message-ID: <CAPvUaSo-ubCOCYYPadY1C23y1Fd_AAhQLuVKWRa6F1XVh6mk_Q@mail.gmail.com>
Subject: Re: hp-wmi: WHCM AE_AML_OPERAND_TYPE and fan init -22 on HP OmniBook
 5 16-ag1xxx (board 8DF4)
To: Krishna Chomal <krishna.chomal108@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, W_Armin@gmx.de
Content-Type: multipart/mixed; boundary="0000000000008ff39a065da0354e"

--0000000000008ff39a065da0354e
Content-Type: text/plain; charset="UTF-8"

Hi Armin, Krishna,

Thanks for the quick replies.

acpidump:
https://gist.github.com/CollevecchioLorenzo/aef5917d9775629d48618bd42cb5f5e2

I booted 7.2.9-2-cachyos with modprobe.blacklist=hp_bioscfg
(confirmed in /proc/cmdline; hp_bioscfg is not loaded). Counts of
each message in dmesg, before and after:

  WHCM AE_AML_OPERAND_TYPE:                 3 before, 3 after
  "Failed to apply initial fan settings: -22": 1 before, 1 after
  WQBC / WQBE AE_AML_OPERAND_VALUE:         1/1 before, 0/0 after

So the WQBC/WQBE errors come from hp_bioscfg, as you suspected. The
WHCM errors and the -22 are not caused by it: they still occur with
hp_bioscfg blacklisted, right before "hp_wmi: Registered as platform
profile handler".

Windows, as you asked (Krishna):
- The Windows power mode setting exists, but that is standard
  Windows, i didn't check for HP specific.
- Omen Gaming Hub offers a performance mode
  option on this laptop.
- The BIOS has a "Fan Always On" setting. I had it turned off

Happy to test any patch or run further commands.

Thanks,
Lorenzo




Il giorno lun 12 ott 2026 alle ore 06:03 Krishna Chomal
<krishna.chomal108@gmail.com> ha scritto:
>
> +Armin Wolf
>
> On Sun, Oct 11, 2026 at 06:03:25PM +0200, Lorenzo Collevecchio wrote:
> >Hello,
> >
> >I am seeing hp-wmi fan interface failures on an HP OmniBook 5
> >16-ag1xxx. This is not a gaming model.
>
> Hi Lorenzo,
>
> Thanks for reporting.
>
> >Hardware:
> >  product_name: HP OmniBook 5 Laptop 16-ag1xxx (16-AG1002SL)
> >  board_name:   8DF4
> >  BIOS:         F.12, 04/10/2026 (no newer firmware listed on LVFS for
> >this machine)
> >  Kernel:       7.2.9-2-cachyos (also tested 6.18.55-2-cachyos-lts;
> >ACPICA 20250807 vs 20260408)
> >
> >Symptoms:
> >1. At boot, \_SB.WMID.WHCM (called via WMAA) fails three times with
> >   "AE_AML_OPERAND_TYPE: Needed [Buffer/String/Package], found
> >[Integer]" while resolving operands for [Index].
>
> This is likely due to hp-bioscfg instead of hp-wmi.
>
> >2. Immediately afterwards: "hp-wmi hp-wmi: Failed to apply initial fan
> >settings: -22".
>
> Ah yes! This is because we are currently enabling fan control for ALL
> devices. If you share your acpidump, I can check if we should use the
> HPWMI_FAN_COUNT_GET_QUERY to decide whether to allow pwm1_enable or not.
>
> >3. Later: "Attempt to CreateField of length zero" in \_SB.WMID.WQBC
> >and WQBE (AE_AML_OPERAND_VALUE).
>
> This is also likely due to hp-bioscfg. Try booting with kernel cmdline
> parameter "modprobe.blacklist=hp_bioscfg" and see if these disappear.
> That will help us narrow down the scope. But in any case, I think Armin
> Wolf will have to help here since I am not familiar with bioscfg anyway.
>
> >4. hp_wmi still registers as a platform profile handler (quiet
> >balanced performance).
>
> This is because 8DF4 is not present in any whitelists, so it takes a
> fallback path and uses legacy WMI queries. Honestly, I am not sure if
> platform profile should be registered for OmniBook devices. Could you
> let me know if Omen Gaming Hub on Windows allows you to switch
> performance modes or there is no option for this?
>
> >5. /sys/devices/platform/hp-wmi/hwmon/*/ contains only pwm1_enable
> >(rw); there is no pwm1 and no fan1_input.
>
> Intended.
>
> * pwm1_enable - As said, this is because we are currently (incorrectly)
>                  enabling fan control for all devices.
> * pwm1 - Absent because manual fan control must be unavailable on this
>           board.
> * fan1_input - Absent because get fan speed query must be failing.
>
> >6. On the LTS kernel the same WHCM error repeats about every 2.2 s
> >while something polls the hp hwmon device (277 times between 551 s and
> >1165 s uptime).
> >7. ACPI thermal: "Invalid critical threshold (-274000)" and "No valid
> >trip points!" for thermal zone TSZ0.
> >
> >Fan behaviour:
> >- acpi_fan (acpi-fan PNP0C0B, "Using Microsoft fan extensions")
> >exposes fan1_input. It sometimes shows about 2400 RPM and sometimes 0
> >RPM.
> >- The fan works normally under Windows on the same machine.
> >- I once saw the CPU around 95 C with the fan apparently stopped on
> >Linux; I have not been able to reproduce it yet and am collecting a
> >temperature/RPM log.
> >
> >I suspect the WMI query path the driver uses for fan settings is not
> >implemented by this firmware, so hp-wmi should probably not attempt it
> >on board 8DF4. I would be glad to test patches or provide acpidump
> >output, WMI GUID listings or any other data.
>
> acpidump would be helpful.
>
> Thanks,
> Krishna
>
> >Thanks,
> >Lorenzo

--0000000000008ff39a065da0354e
Content-Type: text/plain; charset="US-ASCII"; name="blacklist-boot.txt"
Content-Disposition: attachment; filename="blacklist-boot.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_mv4xj8h90>
X-Attachment-Id: f_mv4xj8h90

WyAgICAwLjAwMDAwMF0gQ29tbWFuZCBsaW5lOiBCT09UX0lNQUdFPS9ib290L3ZtbGludXotbGlu
dXgtY2FjaHlvcyByb290PVVVSUQ9MWZjYWU4YzgtYzI0Yy00OTMwLWI2ZTAtMzYzMmI5ZTY2YTE1
IHJ3IG5vd2F0Y2hkb2cgbnZtZV9sb2FkPVlFUyBzcGxhc2ggbG9nbGV2ZWw9MyB1c2Itc3RvcmFn
ZS5xdWlya3M9b2JkYTo5MjEwOnUgbW9kcHJvYmUuYmxhY2tsaXN0PWhwX2Jpb3NjZmcKWyAgICAw
LjAxNDg1NV0gS2VybmVsIGNvbW1hbmQgbGluZTogQk9PVF9JTUFHRT0vYm9vdC92bWxpbnV6LWxp
bnV4LWNhY2h5b3Mgcm9vdD1VVUlEPTFmY2FlOGM4LWMyNGMtNDkzMC1iNmUwLTM2MzJiOWU2NmEx
NSBydyBub3dhdGNoZG9nIG52bWVfbG9hZD1ZRVMgc3BsYXNoIGxvZ2xldmVsPTMgdXNiLXN0b3Jh
Z2UucXVpcmtzPW9iZGE6OTIxMDp1IG1vZHByb2JlLmJsYWNrbGlzdD1ocF9iaW9zY2ZnClsgICAg
Ni4xMzkwODZdIGlucHV0OiBIUCBXTUkgaG90a2V5cyBhcyAvZGV2aWNlcy92aXJ0dWFsL2lucHV0
L2lucHV0MjMKWyAgICA2LjU0NTcxMF0gQUNQSSBFcnJvcjogQWJvcnRpbmcgbWV0aG9kIFxfU0Iu
V01JRC5XSENNIGR1ZSB0byBwcmV2aW91cyBlcnJvciAoQUVfQU1MX09QRVJBTkRfVFlQRSkgKDIw
MjYwNDA4L3BzcGFyc2UtNTQ1KQpbICAgIDYuNzQ5ODI0XSBBQ1BJIEVycm9yOiBBYm9ydGluZyBt
ZXRob2QgXF9TQi5XTUlELldIQ00gZHVlIHRvIHByZXZpb3VzIGVycm9yIChBRV9BTUxfT1BFUkFO
RF9UWVBFKSAoMjAyNjA0MDgvcHNwYXJzZS01NDUpClsgICAgNi45NTM1MjRdIEFDUEkgRXJyb3I6
IEFib3J0aW5nIG1ldGhvZCBcX1NCLldNSUQuV0hDTSBkdWUgdG8gcHJldmlvdXMgZXJyb3IgKEFF
X0FNTF9PUEVSQU5EX1RZUEUpICgyMDI2MDQwOC9wc3BhcnNlLTU0NSkKWyAgICA2Ljk1MzU0OF0g
aHAtd21pIGhwLXdtaTogRmFpbGVkIHRvIGFwcGx5IGluaXRpYWwgZmFuIHNldHRpbmdzOiAtMjIK
WyAgICA3LjM1OTcxOV0gaHBfd21pOiBSZWdpc3RlcmVkIGFzIHBsYXRmb3JtIHByb2ZpbGUgaGFu
ZGxlcgo=
--0000000000008ff39a065da0354e--
