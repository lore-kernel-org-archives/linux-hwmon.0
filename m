Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A679D2DB7BE
	for <linux-hwmon@vger.kernel.org>; Sun, 11 Oct 2026 16:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791734620; cv=pass; b=tYKmD+qSFgi6B1FHxN9F10NvPSrdjQcIZgyqUYAjDN9boBoKOeKQoojnpgYDjqkyMBfmr2p5BgSrovbHJmZfKFb7U5BD0SV1keC8O9SbEOH5XvW3hwN+yJSLz4aB2oRmXFnMf1sncTU2jXbQ9Cyk43kBmiiDdHDmxTmBYPL83X8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791734620; c=relaxed/simple;
	bh=b1iXLNnxmMfxdkLth2B+WAyB1Zb8M6f97ML8FgaIeyM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=dYUKMjDUIaxcBYjQos1dCyGjVFrAGCFECiPYSeaEMVzr5pqlnPSP8SKw+GfY8SRDJZMrHOTDOl/VNAxs0asGlsztjm4mJZeyX/NiALPhuqX8VXqOecBsZcVHLi4l5cjm56IdwjZSD+12djEh7XHaPDhlA13AdAIKvW04RI6xQKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lLhBI0wj; arc=pass smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lLhBI0wj"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3a77fd51505so1507501fa.2
        for <linux-hwmon@vger.kernel.org>; Sun, 11 Oct 2026 09:03:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791734618; cv=none;
        d=google.com; s=arc-20260327;
        b=fSrUHdDgYHU9I6l8uEiBCbKguv6nhpfphB58ObnX0cVhw+OS7vencLVAVLFLUSbPv9
         4S+JXNJAt/29gggwlZYPpoP0eTRK/4qm7dBk2w/lOAacrnd8/2PlHgIx/bQRVw3RCH++
         W92g32e9OTbNteR084EmUC00nEmYt1/p8LYWpuLMOszJ/UGVzVb8Heb/G4IcI5O6D3gX
         +Qyn7HPTdHGZ6Pgau92idJEy1GUo2+T+UO/3eS+jaawXjPYTHxWBqGHfJn/YrY1jxK37
         Wb3lqry8ikMTgsCaTlqnzEWzloSJwWcylsF5HS0Rk4xWQW81siZud7lCIQYGr1WSm7qk
         QOzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=/PMSeNAK3G1G5kn1Fzn6SJkaNYLMwbOteLsGmnNeuhM=;
        fh=cNgNk11VsdLM8T40QHxlB8o9rDKYm7U/0/Y4YOoJ8Ik=;
        b=oVp3UJGzXGjJjPV8oR4QLYkCSu4N+VP4HygxNt9qAi6hVVjgsLcSe0893pf7ow0cTH
         x+lKNKYFo0mb3FVRs0rFWeNc2SUvgvWS3k5SJPbq8ROub4EX/DZtlGOelqHil0OPuyZA
         OzWm7P20vb6dBlkmjaHbPxO20oT5B2uKhUKYuoULwv1Q4h0RCF2pieViJagQ+Hrh+IEZ
         WQoEZIiDNael2IpBgPk+S+qhMcaeRNEMxmH+K1NcpWqXrH25DFFZYMgl4BB0J6y47ncg
         ZMkQ1WJ8pc+KPU3fOngEEnKV4uT1kZrXjjfAcuK8QBO3zi0tbHQjha/jm6ARxPJ9EULi
         R3Lw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791734618; x=1792339418; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/PMSeNAK3G1G5kn1Fzn6SJkaNYLMwbOteLsGmnNeuhM=;
        b=lLhBI0wjeYMtpqAHjc+I9x/37hOJrqnrbGa/wJDXM4pRPFHoxhIKG7+53P4r15Agjw
         vechKl23smX01l7Z2HtXxABzo5+rdMcw5OwN23F7rtntFAok/TIWaPFeFQ6u8Sa0m1HU
         KlRpeFDhCerG9Xkc9uKF1zeUkpp/NgW2pLv2A0zHvBlaDo6zOphDP+0X3S1BlT4+9tcU
         Sa53v4lUoSd405tBWYMxteFUkvc19YEJv/LxZllATEf2s9r6CFi574Rek2POhRE9e/yt
         equRJ49dJEBtMAiU5f5xwawmrHAhfirbEDfb3IaSzDoCklJGDmYYGhUXnkfc31nbOen/
         SwkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791734618; x=1792339418;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/PMSeNAK3G1G5kn1Fzn6SJkaNYLMwbOteLsGmnNeuhM=;
        b=z5/gCNvCunwCNTQLWc8HEWkwLAu5EeR11vrTkIad5yRuEqxW4C36GxLS7h2KXgF2cY
         wVnIZ0HzyXI4dgN/CqEE9m0gftbimBODzQMElntMFvKYBGHh8NKOtxxD7JAA4NEfSpL/
         HT4GZdDPhsxbA0HVVdpiZjZ82Owx5PUnLnCMd/yOPqRGUpTihppQw8N6XxLBrmIa1o6p
         31clNKF/YtLAV3AqCuaXWf79A2a6OPZD3c4ITOdNAuFhBEloeFcbgWfP2P4Z5XNmHdxl
         sfufE+5e2dW2Atlh77vR6/Zefecin2QOO1nLeJHgwk53bQtvBqmmPlcRSScVivR5xeAF
         O6bQ==
X-Forwarded-Encrypted: i=1; AKwUvBwl+ev1im/oQW2ItgTbzkvWoe2BSDnWWkHikgi196687Mcceb0JhHrioj+0nzsgkwAYX+xwpOmE1y5Zwg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKq+5KKAGee5Bk/US6AtbazYXV1oZQioRxhGKM/PBsfllKKFCTJ
	piWICdnXNrtWAxq73/fo6GCQ4DClwZzjztIBghi483jhosTpAS7afZ/oaPuXBkOB6DC27T1owRG
	wHuLg8deRWrqn6fKod+u61kR2BtrQDVQ=
X-Gm-Gg: AYBFou2G31whtwpCsLgamU80uxLRINtJjfAoJLGdLVsMqGo1FfMd4EVL0yljpbVmnPB
	1iHbRMbvTyzpCykCyu62yFh7g6+hDtVgp1zyQCAcWWx6EAy7QZwOG9LMyYw8GeOG96Nelyn8ES/
	8dzajklyimbgpWtiEFxhF/ozconnEBIXGa/N1ADj33+4YlsC2YQ48wbdHgSFYhWNDvOH8tk2+m+
	TbEnzLO2a6TvVdoU8Vh5E3y0YL8EY+H1x8AY0LJ0BJk2Ybm1jdD4da/tYV5OL0wrrXxDk5Y4E0C
	a+wa9f/5m4HW+o6yICG+HgRtbyvFlmeeQa2FfBpt6beVVu55dXVhRwkMKh28ba+oAwgTxElMLrS
	PyIictUTfaTW0fRvDFJ9aj68=
X-Received: by 2002:a05:651c:1448:b0:3a5:cee6:9413 with SMTP id
 38308e7fff4ca-3a9c513afa5mr13579721fa.1.1791734617412; Sun, 11 Oct 2026
 09:03:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Lorenzo Collevecchio <lorenzocollevecchio17@gmail.com>
Date: Sun, 11 Oct 2026 18:03:25 +0200
X-Gm-Features: AclHuK995l-38syMAtORusdE9_IR8iSJRcB-5VI4C0rfZ3oDBfMdVrg5rlpAnDs
Message-ID: <CAPvUaSo1D+1Tvk3-4TMiXw-ScBtY8Mu0FzO7R_EG6zrjYfjYqg@mail.gmail.com>
Subject: hp-wmi: WHCM AE_AML_OPERAND_TYPE and fan init -22 on HP OmniBook 5
 16-ag1xxx (board 8DF4)
To: platform-driver-x86@vger.kernel.org
Cc: linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

I am seeing hp-wmi fan interface failures on an HP OmniBook 5
16-ag1xxx. This is not a gaming model.

Hardware:
  product_name: HP OmniBook 5 Laptop 16-ag1xxx (16-AG1002SL)
  board_name:   8DF4
  BIOS:         F.12, 04/10/2026 (no newer firmware listed on LVFS for
this machine)
  Kernel:       7.2.9-2-cachyos (also tested 6.18.55-2-cachyos-lts;
ACPICA 20250807 vs 20260408)

Symptoms:
1. At boot, \_SB.WMID.WHCM (called via WMAA) fails three times with
   "AE_AML_OPERAND_TYPE: Needed [Buffer/String/Package], found
[Integer]" while resolving operands for [Index].
2. Immediately afterwards: "hp-wmi hp-wmi: Failed to apply initial fan
settings: -22".
3. Later: "Attempt to CreateField of length zero" in \_SB.WMID.WQBC
and WQBE (AE_AML_OPERAND_VALUE).
4. hp_wmi still registers as a platform profile handler (quiet
balanced performance).
5. /sys/devices/platform/hp-wmi/hwmon/*/ contains only pwm1_enable
(rw); there is no pwm1 and no fan1_input.
6. On the LTS kernel the same WHCM error repeats about every 2.2 s
while something polls the hp hwmon device (277 times between 551 s and
1165 s uptime).
7. ACPI thermal: "Invalid critical threshold (-274000)" and "No valid
trip points!" for thermal zone TSZ0.

Fan behaviour:
- acpi_fan (acpi-fan PNP0C0B, "Using Microsoft fan extensions")
exposes fan1_input. It sometimes shows about 2400 RPM and sometimes 0
RPM.
- The fan works normally under Windows on the same machine.
- I once saw the CPU around 95 C with the fan apparently stopped on
Linux; I have not been able to reproduce it yet and am collecting a
temperature/RPM log.

I suspect the WMI query path the driver uses for fan settings is not
implemented by this firmware, so hp-wmi should probably not attempt it
on board 8DF4. I would be glad to test patches or provide acpidump
output, WMI GUID listings or any other data.

Thanks,
Lorenzo
