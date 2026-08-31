Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7A63B2FC8
	for <linux-hwmon@vger.kernel.org>; Mon, 31 Aug 2026 07:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788162845; cv=none; b=bpNEqkrN1Uu55u3zbO5d4Bs5EKbpEVaWVm0DQ3emkxHRS0fesFHrCzri51iUcHUWw9KjDgF3Pv4PXgWhW6vVPzf0VpLa116bsFMG2/h8cUBFX3tIbqvWG00RZCSLjf+7OHqpWTBtI+Olxy5tMtXhFUSBKdqW8bc/19K5j6Rc3H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788162845; c=relaxed/simple;
	bh=o+nv3GS3nR3FzyVR/oiyw6wodd+l3ZqiVNhB6DUQA40=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E+mrClJ+gRqkFa/6boKCMegr9cZAVx/CvkVvP/q15qTTfNJ64uv4BQ0BVGjBx8yGpqVLq4LSksL5lG8lFK2JSg7yx74so/SR0De2v1oaa9bxCpmPLvsS36bmoIJp4k7x6O9uceiOu4WHbAIIRJdN5WNvErCFOnoU64P3uEaHXys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qE7dTxzi; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qE7dTxzi"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso3671186a91.3
        for <linux-hwmon@vger.kernel.org>; Mon, 31 Aug 2026 00:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788162843; x=1788767643; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0hUiROj/TsY8I709fp6Eg5xqKVDPTNNMVY5D3Z2bgZ0=;
        b=qE7dTxziS10R1BoElXLzLMeSF/qIXlSfu7zKMmV5Apy/6/bJ1h6/4bUo9jn/3TD998
         mbq/jR+MbzW9to65y+whbQgrOPO8Bo1LuWHRwDVfIGLcCKK/L4zlxHxFYMNitAxGtPRW
         CG2c3GLagBOXP8ilkcwpwRK1r4lDjIEwLG0BrRepvlKpzAPdlln6Lgn4TyVXqxAEYJCi
         fbvqc345kKZxE5bvIpSDYXyIn38ysWV69HyDD2fCJUs+hyZUbP3kNJ1V2EUN5FKHXcSJ
         Jl5+YNWYXs6Jhtw/q2AwgC3YXW8BhIonzXvJ6YwX4tIrw+EUKimQMPpZTGLRDL8ryVhA
         TvfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788162843; x=1788767643;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0hUiROj/TsY8I709fp6Eg5xqKVDPTNNMVY5D3Z2bgZ0=;
        b=LvqDW12R1oTb+F6VQCLetNk4GeRilfsr+Klzn2nfu77iBHkbBTzHRLCJKI8QfkwXAJ
         xrKXKm43vnS0Sr7+wgA6tm5RTtDk26OouSi4w4KI/WJ19rbHpb7gIH/GtNKmBsB+q3wl
         fV9H/Oamw91+/lXojUspMdul4o0mjMyPrcEqFJ67HuLaHLlSZGB3ysPYyRar7/y/3QJF
         VWMNqdIqfkv1/0z+bOY0EAOlAQWYkDwFyf9slaMLk2moYm2sigfqk9DcNdFD7BtQIZs0
         hZGvHW3TLdNgbeP90/Baq1z0ZCrddwrM1OiIEn3ZdHMFHvDv1mjD4OURfLOHTUQZSJfC
         nSrg==
X-Forwarded-Encrypted: i=1; AKwUvByiPDqAZzNuE+cI4YMHhL96O9gHOvbwWKn/a/hua0jZvTgR8CbuxtpTBOlLhzFUkJZAPpiW72V9iuAZOQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lx05pvUEe4m69Zkiu+H326d7MD+LMw/54H9yk+C/b+FotbToh2
	hqWXv0IbipoOxIL16GwhID/StMo0qqWBQne1izH57xlJJPTSGixzjP6p
X-Gm-Gg: AYBFou1DXoh+wlZYpwa0h1Ggw3EEGr44k4eSH/ov4i15X9EYP1UQQcBwpX+VHnesa7W
	npacgs4QDAYrTTVpzl0fVbk1ZKWb+7ht1tPYhGlmm23Vwf5KdQVXndyphhUlnpVHI9cmVE122u8
	04D5KEanOv3/+fE+WnBM8LUKatmEItIefQphVKMP9ueCujul/35rviy7mTDXPTU6+zF8i1LTJbu
	ZH00fSrIUKTOS/SlEmVIM1nknlAlbCtDekN3asAI33i2laZpPSZBpwyvRl0reV3OlvjTyiTJko9
	/zzPVzAXL3FDG6zCRQTMvbAeXOYB3bretIhkALpceZ6t0eTqO5iZsWMfzYUyDmaLuGh8O/f58Cf
	L5Q9xyIp8obRYFBg5aFmN51KMzsAtOsPLgwFaOzW5yzUOIrvFZNM8/a5jMPiM+aFy+J9iEOvniV
	SZoZzzMcCidwrpuhl4U60zZ+0UCXkUNl43ue/UYVWfPHhc9h7ZCIdyPnMV3faLq3PPLjEupW7dd
	WcnXuhIqqsabDxt3Cch3FIn3P04gkI8nqcfO7nUXSwzPoZYXWQ6yUgobSLrDdqtsgHZyQxzBaIV
	R0KIDuM=
X-Received: by 2002:a17:90a:e70c:b0:398:9be8:ea68 with SMTP id 98e67ed59e1d1-398f86c8470mr2607153a91.21.1788162843411;
        Mon, 31 Aug 2026 00:54:03 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([103.16.69.192])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d40ac7sm25336992c88.7.2026.08.31.00.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 00:54:02 -0700 (PDT)
From: Aditya <mradityadash@gmail.com>
To: Derek John Clark <derekjohn.clark@gmail.com>
Cc: Ilpo =?utf-8?q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>,
 Mark Pearson <mpearson-lenovo@squebb.ca>, Guenter Roeck <linux@roeck-us.net>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [RFC PATCH 3/3] platform/x86: lenovo: Add Legion Go Fan Method
 curve driver
Date: Mon, 31 Aug 2026 12:55:03 +0530
Message-Id: <53842308-7AA5-4885-94D9-527F6140CA6C@gmail.com>
In-Reply-To:
 <CAFqHKT=ozs1i1GwTwhh_A3DQauvn78cL8GHvJJGz+arRsZ=1Vg@mail.gmail.com>
References:
 <CAFqHKT=ozs1i1GwTwhh_A3DQauvn78cL8GHvJJGz+arRsZ=1Vg@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Derek,

Thanks for the review.

I have been investigating the BIOS of a sample of devices, which can be
broadly classified as follows:

- Do not have Fan Method
  - 8JCN - Legion Y530-15ICH
  - BHCN - Legion Y540, Y545, and Y7000 2019 families

- Have Fan Method
  - Do not have Method 5 / stub
    - K1CN - Legion 7 16IAX7, Legion Y9000K IAX7
    - JVCN - Yoga Slim 7 ProX 14ARH7

  - Have Method 5
    - Take direct input for Method 6
      - All Legion Go, Go 2, Go S (N3CN, RRCN, RQCN, QCCN, S0CN)

    - Take index based input for Method 6
      - Have Method 5 SensorTable equal to Method 5 FanTable
        - M3CN - Legion Slim 5 16APH8, 16ARH8
        - LYCN - LOQ 15APH8, 16APH8
        - R3CN - LOQ 15IRX10, 17IRX10; G5000 IRX10
        - R8CN - LOQ 15AHP10

      - Have Method 5 SensorTable be all zeros
        - N2CN - Legion Pro 7 16IRX9H; Legion Y9000P IRX9H
        - LPCN - Legion Pro 5 16ARX8, Pro 7 16ARX8H, R9000P ARX8
          variants
        - KWCN - Legion Pro 5 16IRX8, Pro 7 16IRX8/16IRX8H, Y9000P
          IRX8 variants
        - MHCN - Legion 9 16IRX8
        - RYCN - Legion 5 15AKP10; R7000 AKP10
        - Q8CN - LOQ 15IAX9E
        - Q7CN - Legion Pro 7 16IAX10H; Y9000P IAX10
        - RZCN - Legion 9 18IAX10; Legion NX IAX10
        - RGCN - Legion 5 15AHP10; R7000 AHP10
        - RECN - Legion Pro 5 16AFR10; R7000P/R9000P AFR10 variants

For the direct based families, there is no actual discriminator or
value that can tell that the devices take direct input. There are two
possible discriminators I have found so far:
  - SensorTable contains 10, 20, 30, ..., 100 exactly
  - Their Fan Table GUID read function is a stub
    - However the Legion Go 1 does not conform to this, therefore it
      has to become a quirk.

None of the direct based families expose any information on the range of
each point on the curve. 0-100 can be taken as the nominal range.

For the index based families, Legion drivers send the current power tier
(current_mode) as the first Method 6 byte. However, this value comes from
the Other Mode GUID.

All families can use FanTableSize and SensorTableSize for their respective
Method 5 arrays. FanTableSize can be used for the Method 6 array size.

Then, based on this power tier, the respective Fan Table GUID table is
accessed. FanTable_Len for that table determines the range of each point
for Method 6. Each index will be within 1..FanTable_Len.

None of the reviewed Method 6 implementations consume SensorTable values.

The driver should not read back Method 6. Consumers can use Method 5 if they
need to confirm the result.

The Other Mode GUID for these families did not seem to have a fan table
route through it. Only Full Speed and individual fan speed controls were
found here. The firmware based fan curve remains under Fan Method 5/6.

Regarding individual fan speed controls, they did not work on my Legion
Go 1 device. Submitting RPM to it does not change the RPM. The EC fields
which take this input are not exposed to any WMI interface as far as I
have seen on the Legion Go 1.

This also cannot replace firmware based fan curves as it will require a
userspace driver to continuously monitor temperature and set RPM.

Some open questions:

- How should the Other Mode dependency be resolved? Should it be a helper
  in Fan Method, or should Fan Method be incorporated directly?
- What should be the discriminator for direct based families?

Thanks,
Aditya
