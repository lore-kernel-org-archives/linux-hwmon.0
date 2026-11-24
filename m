Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795544732;
	b=T6T6a7PVSgnSVrqKxaeVHab4T3Emk8ztmjJGhF1H9eknrJ7TLw2BT7bu0Gq+6EGvj6fM
	 DsrmIGQjUq/ZMUUgAlQltTNGnua/AynhrbgnUJwe1jvWKxqfWZbTQvCr++vJJTTFx676P
	 /6aR7KIgeLm3tXhCMLcJtuG+cM+bEmjWHmc9S38ryl9N32MhL5+0UsAAiauNf3TuXhOmx
	 wCCKi4FrbgKWQElmLM8EJcXsi9il4uS0JWh84yrvpr/3KG0OFqnyBL9OIFgi11EPrvvei
	 WN8nLOC+MhrPpURk2+Z5RcrrVlkNrB6TYOhFM0JxiajHKroeYjCtDMl1ZJzhxPOkVaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795544732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=RO17y2qHyRkWnZIJADxmnMrdvV11weGwu5opETToOIA=;
	b=Jf/z7l5bdfTUzu+2eySBySmJsRhyY8JaV91i/csHUMiWxmh+yBCe65hXC1UJa6DBDjuD
	 Yd0UgwpocKiwueTWfUtdxmjNXDWf3lXYcybU/DxKr177NWHqh2/e8WqRqrhBiEINjRuQl
	 XNEB3bsWdO1NxVvs1rXKpfj5/HVu9knLx0sWuGZ69luymT+hSLshsDIfyWiAwQQL+7J4y
	 AuAX+grIQgZv+0QDv2ZHuvSfIy+5jMV/N6qprBqgbGwOhz3pu/1l3zLd3HIifPYS1ePb3
	 WwnH20zyaQemfz4IO34Eey4QiUtQo9HQ23rMFoP7xkUwVGMPlOXyEcb+Sf095x2FYtw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x6njyScM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.46
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781B4606A338
	for <linux-hwmon@vger.kernel.org>; Tue, 24 Nov 2026 18:25:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 781B4606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x6njyScM
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-99e740a7131so2102550241.2
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Nov 2026 10:25:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795544731; cv=none;
        d=google.com; s=arc-20260327;
        b=VkLfQdIyEIc9yT4mTgeCwyhm62+uMfWHMDuc2qvHToeAk1cgTY192ptG6bEY/j+cH2
         n0e5RAmdk2ZlCVQ+TYEt+nIGnRJNnhcxnNnaPtB+tAvly9gEdnjOrt7nnf2nDAsHoxVQ
         J5IYSrnA+AY9rOfi4m8h22PAXh5LuK0bLUvlIKv0imh6pYcDJIIiuk9DjEDgOt/sEzR7
         XP6LPyMFF0o8sYdat9s/KrpE8pGf6uBsvxxVdUyz+KhwxfsGLkw2Zp1QY52iOiLZqldZ
         Rn7CjkXDbcnUpPkIO/p7g745Pcij6jH4WbLSsK+Z3fZzM2yQUtjDuqIOCc6hU0RTjOxC
         Cf/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=RO17y2qHyRkWnZIJADxmnMrdvV11weGwu5opETToOIA=;
        fh=3QcORtEoFFDw6mFaH+gHOywSOgD0tXkVtKf6iHQp+5s=;
        b=X+BhPHSI8Ez9e89YpUM+lMRyrrCYcZr1IjMkPo5BZ77vfLNsTHcNQyVWa1EYxwL00J
         wcg2QhhqOVkfFKxuFnNRAmQdku6/Ks09XvLAsM97+GhRtQ5AygIaovy1PhZxBc+m3dqX
         n2lCpERlYfCcIY7mMnV/Xiqm5bR2FWDd9Ef8UwOdSw0l5Zobl+wUJfYpkbSdT+bVEBpX
         kRVl04T9qWBxGWMBWb2bLI+ItFs61G7ABm/dYQRPvXH19nUvmfM9k3kdWqiTLuY9XZoc
         Cysdsc4X3Rdma7emg2cRb3dcCPVgjt9Wuo61Edicd4ZeZDw/YvYXbhhzuhE8kMiLhy5n
         mkWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795544731; x=1796149531; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RO17y2qHyRkWnZIJADxmnMrdvV11weGwu5opETToOIA=;
        b=x6njyScMNQrdCaUpa4tiXjAZ3ezL8UdUtKFR+KeuF/PfqomUj3D5WHx/qhEQnnyiAo
         1CvxDrTKj7qcX/MKJqR8jcRuJcjw4PyHAVEfMO6OZ8xXQYja5d3D7poGUHwmLx1Vt6iz
         4ebWZ0mqpJVPvp/HXECLAu9tyb2rJD28ze/JWiEzJ41MuvtSPY/3fOF+czSc1QvJcUuN
         la8oloBqWQVwDyOS3zx5W9gU6orlOvU18y3bHrUE3rIC/MZNAaleNkRmLhJ0crzxT9GP
         xADMxWOGgYdEL8pthQxSifrVgmsHaiGv2iizFSKtG51RvzxaU8bVC8xfbCVRj6gcd3AW
         94lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795544731; x=1796149531;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RO17y2qHyRkWnZIJADxmnMrdvV11weGwu5opETToOIA=;
        b=jrcKXWmwpvb/suJgJQEnouLvT2HDNYPFw1FFGHUjcyEA//qfW8bWKJal60yr8ebTrm
         6pVJ/j1wThYxF2I6gGygY7K4wLI2NvoHSOcA2fIk3lWx4D15TPmx57uv//s9W4HdalFs
         TTHmxlReHZycLc5XzJpNgXXYLGXIbZW1p+XNCAcbKkY2v7GmcWZkP1afm9z7ZZUCgNNW
         h3UsTe6+DbS21QkT/8HS9FtvWgNHn+YMqjahErjKjMskakxgwzu6vG6lbc8PcO4WRCH/
         hASN0i6Ez5b5GntKhRcKGmAsmVTUJKwJOFss3zq7HT2+vV+BkLlZqGaSJOgDRD+NZ3WB
         XjXQ==
X-Gm-Message-State: APuU4Z8T2QhwGq0YEX0shNvOniJkYOAGoZO+QN2ixBantYSmGsoTGjqi
	zh2VWF69TUva/ZBOuWI9PA2hSDsAuPGxu75pv6PY6NSQWzM7uV5Uy6m0TVER0nfN2JMXYBN1D1V
	pBySY2cBiulsLgdKsb9tUi1EeBe4Xep4mK9x1
X-Gm-Gg: AZFdTZdEtNpBm1at1xh+2galEvNrMpwV+DAYM4xXHQSzmGTUYNPDA0PHvjYlSRAEQce
	cKQ/sqL7u6XEEhOOL+TgGsNWE3pPPE8gv0O/4ReSDZfuLLpKn2n5HBnRaM5Nz4YjmKYDyWd1gKD
	S4+EcknekhfwNg43c2+3By2Otqw06jb08WFoGhmivqHgpUDHHs2lTRN8Zg0Vx//nOngzc+MBkxp
	zuzKZS8SceOaDZDZ9p+5PhODX6x61/Dy7gWzbiu7owGkmR0gmaS66QD47L27U0CuisO0p96Esss
	QvtoL4VpVFf9AqX/JT/m9Ll2WX1dfLT1IQJ+Xd0+HIyaSizU1LWPPw04BZ6r2rjdZzhaFGHeh8W
	23d2YkgJUZrgB7HPFju9ukpgUVF1t94A2bt0VtQj/rkxwqFfQLF6XUdXZhlWBwcX19HH/W96GWQ
	==
X-Received: by 2002:a05:6102:512a:b0:7d6:bae0:e431 with SMTP id
 ada2fe7eead31-7d73945d06amr8915934137.17.1795544731138; Tue, 24 Nov 2026
 10:25:31 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Craft Objects <craftofobjects@gmail.com>
Date: Tue, 24 Nov 2026 19:25:20 +0100
X-Gm-Features: Aa3M54p3lKbqQYAP9git4b1yqhGpMFWroPmBTkRKWJ_roW6_vb_GDR4Eg9OF95c
Message-ID: <CAJb2vRAgvepJPCJPvqicRCojhzNmcAHbDu0bosO_WTmMHEa7Bg@mail.gmail.com>
Subject: Lenovo P4 fan speed
To: linux-hwmon@vger.kernel.org, dober@lenovo.com
Content-Type: text/plain; charset="UTF-8"

hi,
I have a new Lenovo ThinkStation P4 (machine type 30KN) running Ubuntu
with kernel 7.0.0-28-generic. No fan speeds are exposed under Linux,
and lenovo-ec-sensors does not bind to this machine. I would like to
ask whether the P4 can be added to the driver, and I am happy to test
patches.

What I see:

- lenovo_ec_sensors is built (CONFIG_SENSORS_LENOVO_EC=m), but
'modprobe lenovo_ec_sensors' fails with 'No such device'.
- modinfo lists only these DMI aliases: pn*30HJ*, 30HH*, 30GA*, 30G9*,
30F3*, 30F2*, 30EV*, 30EU*. 30KN is not among them.
- 'sensors' shows temperatures only (k10temp, 2x nvme, 2x spd5118,
amdgpu, r8169, mt7925) and no fan*_input anywhere in /sys/class/hwmon.
- sensors-detect finds nothing. modprobe nct6775 and modprobe it87
both fail with 'No such device', so there is no Super I/O of those
families. The fans are visible in the BIOS hardware monitor (5 fans).
- The platform is AMD (k10temp, AMD FCH LPC bridge). The loaded WMI
modules are only wmi, wmi_bmof and think_lmi. None of the
lenovo-wmi-other GUIDs (B642801B..., 362A3AFE..., DC2A8805...) exist
under /sys/bus/wmi/devices, so that driver does not apply.

dmidecode -t 1 -t 2 (serial number and UUID removed):

System Information
  Manufacturer: LENOVO
  Product Name: 30KNCTO1WW
  Version: ThinkStation P4
  SKU Number: LENOVO_MT_30KN_BU_Think_FM_ThinkStation P4
  Family: ThinkStation P4
Base Board Information
  Manufacturer: LENOVO
  Product Name: 1071
  Version: NOK
  Type: Motherboard

DMI: LENOVO 30KNCTO1WW/1071, BIOS S0PKT0EA 08/12/2026
SMBIOS 3.7.0

Questions:
1. Does the P4 use the same EC interface as the machines already
supported, so that adding a 30KN match to the DMI table is enough?
2. If the EC layout differs on this AMD platform, could you point me
to the documentation or a patch I can test?

I can run any test module or patch you send and report back with the
sensors output.

Thank you,
Johannes
