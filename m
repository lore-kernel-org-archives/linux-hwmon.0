Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D99B3A9625
	for <linux-hwmon@vger.kernel.org>; Fri, 15 May 2026 03:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778816126; cv=none; b=MX4vQD2Q5+gbKRbRT0bslYWM7vrREwFaBYCUo/vh9Oat1qQVwVFAtJW66vSLEAevmQtCJjF2lnodg3fw/xNi20Jl3WD9JCDNAMyyCIrm7KPjWMJm/aZCWUZGMqtikxX6Qk26IBdct7P6Y+BmlCE0054xSCusLUcRcpTLUYRb1oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778816126; c=relaxed/simple;
	bh=HO2mJExbE8f+6UxANeKavvQtccKxSiQmPCYxu+evLrA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=J1IuzON6B5WWDEhX5OMAmsbGKwRZv0iBMNOjmwQ0g46UYMcVi6HtMLIm4gC1PhfR/u9ouYfOIthomAX32fuMW1JQ8A5Nj14hsGx5XdFtCojjHIY+gKXU0nJsTojW7LWpAuMm7gxiCYFGP1jF41hMxyzJxIalTbRAsQSUqMc02F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=Us7I1vKt; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="Us7I1vKt"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2f0d3e07e30so20653067eec.0
        for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 20:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778816124; x=1779420924; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z8+dwOtJYto6ShSRji6TLpfUsPEIAEbZrL6FWuv5sdI=;
        b=Us7I1vKtcYW+1NtOxFgGudRBs1jchlPldbuZfzHahsSnsuDTqTpj75RgyAYSb6xsHZ
         3SBTfk9N21zWH+bUVSQ3NSXXMQZg88LZvXO0ZyB4YAARxSt2uIy+3SZvZvW3ZW87vmtG
         6pxgtNzMjZu2VUJezVbo5lsBK4kI0XDQ2c9bo1eIiyj4VG7QJiLfPBZj1n6WL6lOXTf4
         BEC7lM1xI7A6BbC50XbHqvhXf3ybNIic/ZunaP0aTFatHJey5ISOCfe+9QedHqqrJWV+
         VvnmXnBJh0LRcZsDoKYnzXaWZzT2aUtCAzSgsxdx74dh4QuoUukrhfD2KEVeWa8m38Pe
         dkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778816124; x=1779420924;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z8+dwOtJYto6ShSRji6TLpfUsPEIAEbZrL6FWuv5sdI=;
        b=fU0joEhHd1uT+gbEoCfcwifIpJTcQw3E+x7frE4Bs71PKuWQpxrXHvdPy2U3tSgfz2
         +2NrzRWToDYYCsbiG4uVZSI4vJbtRfzNlb1ODYl9MJ0vYWa8K9j3R2IQV3hifcyANzlx
         gHw7s5C4GiXaqDw1HEQRG7liuQPhReQUT6c0r6biygjhDOhq8khKGDOOJuOHrien/WIZ
         yK6CVr38cysfU5RnkTH9oCDjk126fjoxjzH848NtC2v5qxfI37W+EJJtlz23KTnmH7BG
         fBUmYRcKX1j//osoZB004+wxN1x2SkmDi3BL78MeMU5GhiGvDD1JNqdARDF/8rgA/dyw
         LsOg==
X-Forwarded-Encrypted: i=1; AFNElJ+dsbbOtZL+HkoeFMum4rDFLD5bwjF146tyR3cqnhPnH51TLn9vw04dtfza9VosXvSDxpiQ2hHaZWh8/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOMCdD6pYqnk5R0b/ZK2T6iTOtVItQ108OTBHnM101AFGXR89c
	KqGNi8LnSwtM2zzYMvcQmwW+K2tpkxUbtGZNrsf2ZnYUjxQm/i087qOFAweyhTNsCbs=
X-Gm-Gg: Acq92OHcvfGh7O4ZIQWNd5VXsPYTQj1piD8UupgFpuUd4h2lHxHE6a5WtNdIV2GVL16
	t1Rw937a1QDj3vedmmd8eDddObJrwi1aK2d9wRlKLN1YYKY9Lk6h1/wcBRXk7GEk3ox8ylB7D/n
	qII9SVRsoVu27dqEHeEAnmnB4bMWNSecctn1vhvsVR2ZVn6ZePesyIFC0Q2KtSTTeSGICMIpp/e
	5TiD7QyV0g264ZgudaC2zG8cCPg3RflBXiHl4L9CTEQ0xxVYXqNk49mZIxm2Kvv42kBgqXY8kMc
	SJh21VphZd+B/qBbjLfCZQ97ksW4GT5wNSukBDgcr1oK04kasS6q19k+oQBH0ePfutRnprZKPvH
	G1aMsQI4B/+losPzX1PGJv7Q5Bo9JcLgxutfEWlQb8GPJ4LP5II1hgP9F0IMkMaDW8IAAhM3ibz
	60iICkRjarvPxis04WozWlCdjPSclrnSajqpfFigqukV2R
X-Received: by 2002:a05:7301:6083:b0:2de:cc07:e99 with SMTP id 5a478bee46e88-30398191496mr1205903eec.7.1778816124428;
        Thu, 14 May 2026 20:35:24 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302978b3cb2sm7062471eec.30.2026.05.14.20.35.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 20:35:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 14 May 2026 20:35:23 -0700
Message-Id: <DIIXOTP9ML0G.RVVC1XIP3IF8@nexthop.ai>
Cc: "Alexandru Tachici" <alexandru.tachici@analog.com>,
 <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Guenter
 Roeck" <groeck7@gmail.com>
Subject: Re: [PATCH v3 1/5] hwmon: (pmbus/adm1266) add firmware_revision
 debugfs entry
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Guenter Roeck" <linux@roeck-us.net>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>
X-Mailer: aerc 0.21.0
References: <20260512-adm1266-v3-0-a81a479b0bb0@nexthop.ai>
 <20260512-adm1266-v3-1-a81a479b0bb0@nexthop.ai>
 <c88265fe-deaf-48e5-9caa-e70f0677e7f9@roeck-us.net>
In-Reply-To: <c88265fe-deaf-48e5-9caa-e70f0677e7f9@roeck-us.net>

On Thu May 14, 2026 at 6:42 PM PDT, Guenter Roeck wrote:
> On Tue, May 12, 2026 at 11:56:24AM -0700, Abdurrahman Hussain wrote:
>> The ADM1266 reports its firmware revision via the IC_DEVICE_REV
>> manufacturer-specific block-read command (0xAE, datasheet Rev. D
>> Table 80). The first three returned bytes are the firmware
>> major.minor.patch fields. This is useful when correlating field
>> behaviour against ADI release notes; expose it through debugfs
>> alongside the existing sequencer_state entry.
>>=20
>> The standard PMBus MFR_REVISION (0x9B) register is already exposed
>> by pmbus_core's debugfs auto-create path and reports the
>> manufacturer revision, which is a separate thing from the firmware
>> running on the device.
>>=20
>> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>
> Applied to hwmon-next.
>
> Thanks,
> Guenter

Thanks!

Status of the remaining three patches:

  - Patch 2 (clear_blackbox): v5 will extend the pmbus_lock guard
    up to adm1266_nvmem_read() to cover the memset/refill/memcpy on
    data->dev_mem as one critical section (per an automated review
    of v3).

  - Patch 3 (powerup_counter): v5 will take pmbus_lock around the
    block read, same reason.

  - Patch 4 (rtc_class): blocked on your reply to my "drop entirely
    or loop in linux-rtc?" question [1].  rtc_class is out for v5
    either way.

The same review on patch 2 also surfaced four pre-existing
buffer-bound bugs in adm1266.c (stack overflow in
adm1266_nvmem_read_blackbox(), undersized DMA read buffer in
adm1266_pmbus_block_xfer(), an unbounded record_count loop, and an
out-of-bounds memcpy() in pmbus_block_xfer() using a device-supplied
length with no caller-side size knowledge).  None of them are
introduced by this series.  My plan is to send them as a separate
"hwmon: (pmbus/adm1266) fix ..." series with Fixes: tags first, then
respin this feature series on top.  Let me know if you'd rather have
them folded into v5.

[1] https://lore.kernel.org/all/DII44YQHQRAQ.1BOWF2JZ2RY5N@nexthop.ai/

Thanks,
Abdurrahman
