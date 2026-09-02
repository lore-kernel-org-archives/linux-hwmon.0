Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3CD47DFA8
	for <linux-hwmon@vger.kernel.org>; Wed,  2 Sep 2026 12:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788353880; cv=pass; b=LP0Bu7NqgEbC0NmN7YHw1IM+bS+lpROvVHplk50y6lOqZb2SvP8DjGpZ+kEQGS8e5DdkB4wW4PlCtT9pGj2PmMTZMiWnIRzIZ6UesJl3XBdlTB+jT8C5bNt8Ff9eHZbVIqgiNd1KLL9tgqf1gMZ8IQaLrJUGfnBsl8GCW11MiWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788353880; c=relaxed/simple;
	bh=NAg28MCRno7XLRszd9hwdwM65vblpqNWzWbbrUyc6qI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=pmiV/35JeIqcs6bz1nkDpnxY1icrHAgFDktxJuOEayPePCrTtgNk2kJg4coIRLgKqPWXiJ3BrNC3XjkzFoKX0Hwd7Ipl9T3MuSWot91s3AmHHjJ3j957jHSdw8/9xte6OvrzpSVgVOBAb6vXSDhOpJi9T2BwjQ1ONxO5Xfnl5eA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SVbzrYP6; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SVbzrYP6"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c1677c91969so97829166b.1
        for <linux-hwmon@vger.kernel.org>; Wed, 02 Sep 2026 05:57:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788353876; cv=none;
        d=google.com; s=arc-20260327;
        b=Emyd3L2d0s5uLOGIHi7vbTRGN7FVt+OCEsm5ubZO8rnluVAgGjc6XM8rXjGMHTVJw+
         9jTHTe/Q9HEoSjhwdKxx6dyzqT41KnbECYMiMWR4j69rvyfU4k5I7wf1gO4Bcous4Zvz
         Pxn7DKfJoG+ceD/gRLabI9MsIvWHWDBL3VUG14X1GVI6kCNg4oxSpZnHZpF4K7G4c3lV
         IqBnrMV7H8Je/9mK3W2uQBs9fhPi9RjcqTlaoUA/fzodFjFfdRcD43GgpjfLOpuL7S3R
         4/HCvTLLLeSlHoi27yAoZckteE9//RXowYaAWlmNMeofgPmWkwx81yt8mhXjRYavJFpQ
         F8xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=NAg28MCRno7XLRszd9hwdwM65vblpqNWzWbbrUyc6qI=;
        fh=EjL14kVWvRQY1kKmKFRN4tADTHmmFcJIXF0+QeWqW2A=;
        b=oskGC4BLbIFmHZrdqR2JFApqw1enffQw/3BP3kLat5NB7+H5rQ6oUlpGSBHBHsqSGu
         IPjVssx3yUZs7nELTogKOQJGcCJYj6rF7BLAhiAOg5QxylQiX2BIL7a1WJucjo9ACn1v
         QpsiyYMBpmE3QEaTPxg2JuQ5wNz/yHOKPnNOD0XDcx5DTzDanRJdtW9h+0BinXan0CLG
         0hfpiZ86v/i5h9p9maRs4Rth+AeY4tL05qybYKTdySFiM5Bw1/XkzwugPxgWes52PZOa
         IFIGuPManipoB2LZmK+VWy0HsPgSZ5i4VgavvOGkKdh46ozlCukGBI8GZ6VfSXbXb9Up
         teTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788353876; x=1788958676; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NAg28MCRno7XLRszd9hwdwM65vblpqNWzWbbrUyc6qI=;
        b=SVbzrYP6Y8JUC9qu/DrxklXV+3bbs0IBouPotKumsmsSn22MsoyutocgL1SsOS7KDG
         pEMaQIgj/B3nydfxhnql7GoqmTs6X7LVsbrOkrgzCkKpQbuNhxvcEXt+Y7TGrzkWG2hJ
         d63647lT3urL+1A4uDhQrl4XZjSEEOES4aVSc77s4L9QTGt487LpbXmyWZlNu+bgxzHr
         qs6i8eHAMghFa2qmoRh1AQcSIEiLssUChQFHL/TVS/Vhrjzmwfb0Dcvs24NFtYslp+hP
         cdkiKBNZ/4GTfrn9Od2i1rX6mPh4tyiJY5ZnCDd7oJN26t7R/dtwwNFwMKAL4dQJaFaG
         EJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788353876; x=1788958676;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NAg28MCRno7XLRszd9hwdwM65vblpqNWzWbbrUyc6qI=;
        b=MfQaFh5dquSfPVXZUZaZ6HDW0eSwbn9mnoHPjPW1SbnlnZFipbtRaJgXlV8EzEjCY9
         l124bAlWwiUL5ScH3Pnns38ZwH07HNtB9j4sidKu/h0XEW1GaP1cfPCxcupRHhLcc8cw
         OiM1h3bU4y2nrMsRsv6I5ZzoQ8UbBG3lcY/CiTJgEDcIsFUTj9YIy2ZsOfXtKFdNuGEu
         T/AiXigkLIeVZyx2wfFhU55SRsSc8YPzWpc5jTCVPncfuSS8Eg0Wr+72bL37kB4bYUQ0
         Ec66vlH7QZwFVwHJKHhf3LeZYdnPj3C5c31+VO+U6gDGf5pH/MJ98yZnMWXhIeOGsznw
         525w==
X-Forwarded-Encrypted: i=1; AKwUvBxOEIhzv7BqYdK4uTM1kOwir/M+VArh8WYgTDa7DCx8/yQlSzQCIRxBUpBPY719UHVUfluRX/duJUAvcg==@vger.kernel.org
X-Gm-Message-State: AFuF++k9FdgW2DE5uhZpu5uPaH1dG1R00T+skJfbM8QrTfcS6WaHI+wD
	QIP1StCYYRT259c8axqyB9hD1bnEt2KdLl+FqS/zwHIttqO2x5zznDwysTE9PfYRxqjCAQwWBqI
	JdFwVa2p0MHTSNAsLJoIV6dIVaEFQPD+cMPcD
X-Gm-Gg: AYBFou0TH71y5fSJi+4NGrnqLe1cMZnM7Xj1pRITf7D4qi9Sr5Fcm0VVmE4VWGqGgWD
	89v7jdp5Zg9XeDx2XHiflP0NXE3sWSzblyg3pHNDpJ/HbIcHXpJRnA4aMcWQ2YpJk/UusRV87zW
	VjVr8Ye4s724Hw+m7m3dMumeGMM01o8Xr44QHdy1h37tPyPyFdrzm4vYSV6zvc7tN+F9QO/mN0P
	I+EOGlEwzyAy2aRPUWJ6P7H8kWqgBandxnlpbwocDTk706Yc0WdrPQS7ENrZizhrr9DZWo7PXVn
	2xvLX73SVK6aEc2sFb9z7hG3qSPI/bmIYrBkk7jdb/W/OA==
X-Received: by 2002:a17:907:1c1d:b0:c12:6632:e7f0 with SMTP id
 a640c23a62f3a-c25d558e49emr308807666b.24.1788353876311; Wed, 02 Sep 2026
 05:57:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rishub Nagpal <rishub.nagpal@gmail.com>
Date: Wed, 2 Sep 2026 14:57:44 +0200
X-Gm-Features: AcwNN1Wxlg2ciUztumNZs08Fv331-ZpBX33uy3hRNZwlmWKFMg2S5hCW9gVuFAQ
Message-ID: <CALCyNyd=pmL2_RSJAOiwpX3x1ctuaXghpUxzfu77PNxHnUjPVQ@mail.gmail.com>
Subject: drivetemp: Unable to read SATA drive temperatures from usb enclosure,
 but can read SMART temp
To: linux@roeck-us.net, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I have a Sabrent HDD enclosure connected through a USB-C bridge. I
noticed that the drivetemp module cannot read temperature information
from this enclosure, however I can read temperature information
through SMART.

Admittedly, I used AI to try and investigate it, and it reports that
"the bridge does not provide the SCSI ATA Information VPD page (0x89)
and the drivetemp probe currently appears to require VPD page 0x89
before attempting SMART/SCT access."

First, is this correct?

Second, since drivetemp supports reading temperatures through SMART,
would it make sense to add a case for similar devices like this that
if VPD 0x89 is not present, but is a sata drive, to query with SMART?

I tested this on Kernel 7.1.10-200.fc44.x86_64

I would be happy to submit or test a patch on this hardware or any
insights on why drivetemp is designed this way, I am not well-versed
in the kernel.

Thanks,
Rishub
