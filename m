Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A1839E6F8
	for <linux-hwmon@vger.kernel.org>; Sat,  9 May 2026 21:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778363932; cv=pass; b=UglvhKApIwvJEE5ejfCgdu1dbMXUJKlg4eYLAtPDvx/BUtdPC3JrBPZBvjTs5h4ZFk22J8sANTgMFimkzco2c0C6zxXxyGHMggMKHHHp7H3xMDVyWzLPOlFapjZ1t2Qhxt2h/nqQQP1ozgAPBN6lbBy8jNat/5cMsoxGr33J6H8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778363932; c=relaxed/simple;
	bh=dm0HlNrhORG5lAH3KtOTjsoyE/sRNZ/1Avn3eZ91HUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tCyInVpuVqFoaQlkWUnO1cnZgugNj+f7JHle/PdGS7YQhASJvK1I1dyfhA+sHSom71WxsEdGlr0Wxgzzr+a+nUxqkYZa+RKGufdlAAjDCEz7RiYk5kJ++fqxdS4E+h8o422wdbo1CkK2N4NF1JbRJ07SSKyxd/EawvDPsCOZ97w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=XZpjv72L; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="XZpjv72L"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7bdc947aa88so25110647b3.3
        for <linux-hwmon@vger.kernel.org>; Sat, 09 May 2026 14:58:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778363929; cv=none;
        d=google.com; s=arc-20240605;
        b=deivp9Op2u9FTdKjWPi4sHUxvVPGHpnBwee7FHJuhPA+VEBIdI7QApFuxg9cjvUjvP
         IEh5Isog6rwdZofTBS3Nf13tlc1OPRjhEkGYAMB7UosO1FTU6sgsFC7XPOBVA2MSm5Qo
         MvY6vZQlukeDrKTEk9lOTGnt1hMyjsBV+PYIPQJL7mgH8PI+vQfcs+jkASvw+o+jNm7J
         VTrVMBfR4S3cZIg0GyZs0SbRBrkyjab/gL97R591ip8W0G2AgdYpBv60APhcYfl/zhkn
         MHDfXofopbVKNI4DMQE97OpyLNbAGBxj/i9Kri3ikgal59D3/ofVc5FYLIdCW+TEJScv
         jN/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dm0HlNrhORG5lAH3KtOTjsoyE/sRNZ/1Avn3eZ91HUA=;
        fh=mpT47LXfjkLgjrcCkBDVVXdDKRoJjbgsi7K4xp4R3mA=;
        b=WnR+gVwA3OwcPgB9mAG+jTcAetcTIEYew0S33MINFF5KNs4hU42Onl0kgb0b9intqZ
         Czc2n/AzVyyq8seLE2CZ0SuhSlzeIFtqSFz2wvm7s7POtHgdSRSRHPNXUnmpjn+6cghT
         p5JzJ2WbQscF5KhhuYGsv7TuvaL2ArQQ7kItGuR8xNQ6YYlpYN4XZoQeVqjKl0ExCT3q
         V0gWLUeF0hXk/k7te5eZUVtqeZ7ibICTTxo7/YxCv+IZej6GAXbxZpAH0p555tTHMnCN
         InbDk9bhxiOoaAMdv031S0FhhWvwKN5b89XZNqEfcfKX8hREZXDCcPs9jU3D8xYn7qC1
         hbvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778363929; x=1778968729; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dm0HlNrhORG5lAH3KtOTjsoyE/sRNZ/1Avn3eZ91HUA=;
        b=XZpjv72Lag5q+NouSuzpHTqGTtpFHuJ8M3cCiAF7ysrMiEmRXSdrluze6+bWDoDr5B
         94A6DUMaVpBBFTsvlRL+t8S8DNYNenRhalxZUi2Ta7YAYS9Faj/8P69I3DUeZWiMj1ht
         1F/wqlptC0jdlNPALXoxTkAbcPvPbppqWAeEXaRCxRB5xf05tyVDsAWEI+tjy+AM2MrS
         fZUmA8T2adC5eOmQVryv0sSE8MOwSQ+DbQ8kx5Qwwwbb/eJVpcLN5H7LU/6nsk3Fr+kh
         zQWZIzwbbvxN3zSwg9Kr8vF267E7+ah35E11TM9HmGZPyfIfp3RKUKIcb8q8hwJykuwt
         PBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778363929; x=1778968729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dm0HlNrhORG5lAH3KtOTjsoyE/sRNZ/1Avn3eZ91HUA=;
        b=gar29vEXAx3a9YbufmlTFTFAKnRtEDUoAwjKgAboPNEZbScM8HFyrqnjd2AIdJWqS0
         k9QHk9N+tUzRklYd3+QO6dByDCwZOIScIKqoAVDSmXeWx3ztVL8+udNsuPLmCdRLmxFn
         cp6/s4GBlkf4mpByb6DawORd5YrVOV2FXJ1mdU61AfXX3qWdxvniqL3FdaYN6BPVwbqQ
         7zAlwwu622XWwktbMvMbqkzf6hLXHXwtD4nWpdpRhj/10iS13Psz7U1uokAKKgRv9ErH
         v38n1nx91dkvXZVZDMnMVgf2iKLH2tpuuBvz6jhuglfvXJdotaTjR8cEl52TMVB2yBH1
         C6sA==
X-Forwarded-Encrypted: i=1; AFNElJ+VFVhxC9jgAOyrsur0k25gJgZsLNu11ONt6nGdJgjP85ZkoLB0iTC9Z2qfruBo9AHVvHWQNFp+dtLPAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu+m0U6/QLdCxwRawMAw3Khe9dHXe8o6NDVTf3UcdwbPwRPQHh
	hVjdEO3I5razXVeGvrXD2CjxRlyOk5oEjU0LQYRqKi+CH1gk1tnL1QLo2soKOZkczBOXI5rmH+9
	WPSc2OE2N41KqEjqwyMExhoOCbNawWU9FFZ3NkD9sGg==
X-Gm-Gg: Acq92OHxLCrgshn1HnBqw8Rx9JKv9S2cGTn7FovE2SwwAbRkBWaujXDOCRjCHRVNRDh
	nuK3D6j/5UrJwpnSPgnqmp1EVkY9x2/DOmaQIwSVlNW4Nv2jaVDG6qtnM/HK6jgMwEXm85uwVp7
	QnthrLzT7Xnqis0Y9hRv3QyfTXAk4ObhvVz84CtowI/gjDsShm02kr4OMTZecvpelLzcq4RnVyO
	/FxDhijuKfco2FjHzhswnaCBsshta6AQebxDOPR4ALKqhg8EbmWEEhB0+Y8+0JM52wiyRTSUkpd
	9REL/28=
X-Received: by 2002:a05:690c:698b:b0:7bd:7afc:ec4b with SMTP id
 00721157ae682-7bdf5eb58b8mr200528777b3.31.1778363929394; Sat, 09 May 2026
 14:58:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508-adm1266-v1-0-ec08bf29e0ce@nexthop.ai> <53d965b4-ab1c-4cb1-9fc3-c99538336d53@roeck-us.net>
In-Reply-To: <53d965b4-ab1c-4cb1-9fc3-c99538336d53@roeck-us.net>
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Sat, 9 May 2026 14:58:38 -0700
X-Gm-Features: AVHnY4KPFt92RvnFzxDYbTomUx_SMoOoHXEVLbm3FV8ovR3W2KZgY12MPugPxl4
Message-ID: <CAGYn4vyDi8Z2i4mvuEZEP-nXCOO-X393=UuaogWJ9k3sXhQ8nQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] hwmon: (pmbus/adm1266) RTC fix, blackbox, FW rev, rtc_class
To: Guenter Roeck <linux@roeck-us.net>
Cc: Alexandru Tachici <alexandru.tachici@analog.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

I didn't see any feedback. Checked my spam folder and nothing
shows up on the mailing list either.

Regards,
Abdurrahman


On Sat, May 9, 2026 at 7:14=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 5/8/26 16:33, Abdurrahman Hussain via B4 Relay wrote:
> > This series fixes a few issues in the adm1266 driver and fills in
> > some gaps, as listed below.
> >
> > Patch 1 is a wall-clock RTC bug fix: the driver currently seeds the
> > device's timestamp counter with CLOCK_MONOTONIC seconds, which makes
> > blackbox record timestamps non-comparable across reboots. It carries
> > a Fixes: tag.
> >
> > Patch 2 writes the 16-bit fractional-seconds field of SET_RTC that
> > the driver was zeroing, restoring sub-second resolution on records.
> >
> > Patch 3 exposes the firmware revision (IC_DEVICE_REV, 0xAE) via
> > debugfs alongside the existing sequencer_state entry.
> >
> > Patch 4 adds a write-only clear_blackbox debugfs file. Devices
> > configured for single-recording mode (BLACKBOX_CONFIG[0] =3D 0) need
> > an explicit clear once the 32-record buffer fills; the documented
> > sub-command ({0xFE, 0x00} block-write to 0xDE) wasn't reachable
> > from userspace.
> >
> > Patch 5 exposes the non-volatile POWERUP_COUNTER (0xE4) via debugfs.
> > The same value is embedded in every blackbox record, so the live
> > value lets userspace match a captured record back to the boot it
> > came from when correlating logs.
> >
> > Patch 6 registers an rtc_class device backed by SET_RTC. The data
> > sheet (Rev. D, p. 22) explicitly recommends "frequently send the
> > time stamp to the ADM1266 to synchronize the UNIX time and reduce
> > the time from drifting" when running on the internal oscillator
> > (no external 32.768 kHz crystal). With this patch userspace can
> > drive the re-sync via standard tooling (hwclock, chrony,
> > systemd-timesyncd) against /dev/rtcN, with no driver-specific
> > sysfs ABI.
> >
> > Patch 7 disambiguates GPIO line labels on platforms that fit two
> > ADM1266 devices on different I2C buses at the same slave address.
> >
> > Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>
> Please address Sashiko's feedback.
>
> Thanks,
> Guenter
>
