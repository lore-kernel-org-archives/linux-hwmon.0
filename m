Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C892C3A5E8E
	for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 04:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778732758; cv=none; b=URWeKk6oXIGD5/myT+iXlc/9pUIATbPThUeu7jKGcnxxmuCjL1rtV8G9cpbgabIvX88v1IuPywHIEdKi5BUPNqayHb3Kt/CD23wLFkKTgEVw8m7JHXtwyMFqUE3Nv39LAmdsRBxeyCfKKmX3RK3rBuSdRbGm614aweeQ0N/Or8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778732758; c=relaxed/simple;
	bh=Xk9UOkNIs/6BZtbVkVNxSjWkErNcowjkARNVXgeAc1o=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=DRsyZi9Ps8U9e03NtyMlKVD+RXe+ufePjVAhK7CL+qR/GJRb1t0VJVzAe2Qk47k/uWK6/fRPCRrgUepeYyisO4uqY64Lhc/8zFOHwzmZKPUIhRI4fes8xbKF90DWswoe5jE/TsJVO5rUNB0tKe9RcbJEnDWwJ7Lr0UTOl1+odj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=QU52XJy9; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="QU52XJy9"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-12c8f9846c8so11257541c88.0
        for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 21:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778732756; x=1779337556; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=13EaFGhc9sBhjVtX9ZyJlLsTcSvLGmruzmbLxhBQiPU=;
        b=QU52XJy9ZlRpHenIyK6djz3UFt5uUyNjvjP+VJMhdCP/KfXAvme8ULuhtDNGJ+mh66
         altNc+sGEBOs2j6zO/w+EwJ8lgSMzGs+F0xOZXECk3Hzj/zoMTDPWybUWv3f09+Xz1w1
         in2nzydjb5Bbx4ctbEKqsRP4z0KRqtdCaYaiN229N3YAkzFhXItF+xV5FhsQu5QtKd2n
         91WnMFmMgGej8cJFsCufEWqZK4Ke3OG48pW9d0wqW9mu4yY10WChZEJFLJO17omUOLyX
         kgihJ7K77lKVTJ3b5dC7dDc9cD+LSUYZ+0rhS1svBjNhz3F3Au7sfsWBKBAKMK7QuTN7
         LECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778732756; x=1779337556;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=13EaFGhc9sBhjVtX9ZyJlLsTcSvLGmruzmbLxhBQiPU=;
        b=ioqyeP3yUS/9vtvyRikLAzk56P8oY9foyOtP37Ta2RsyEW5ipw1h4SmEm8J8dU7+22
         jTQxiU5HlzOK50AhSusLQPb3L7q/YFY5aDKsq6D2DW+YaZ40bwEvGdVcQ3u+0KDfqL/+
         a/tlgwPW10teP5KryXxN0QRn0x4orvDr6vcKc1JBCl9aAk2MP4CMZiJwINTW262qf0Z0
         d+QgaU5FECYAEn6XfvOPvFZvp/1EQzm9iaoa7GMNbCI9QTk8VphHRJYYWURiJihBBxj1
         zakChwzo+E2r4PHPhXd5SAM0zeQ4WpfvuCQ/33yb0hhWPRL53T+CcvZUdbfhnHzlKAGT
         1Afw==
X-Gm-Message-State: AOJu0YyvXOy8T+Ld29oeIgSg5zM0llrQc7BtrIpfXtw1TNu/zCDdfVtH
	ReVOMyWvebb3YMzc5jAimTu6gfb71uu6EEndCQ3jA4qwjjOIgjhAVnnmm25Cfp//U4A=
X-Gm-Gg: Acq92OERpenVtQc7X2pLiMKoz99iWcPcWZvlrxLhnLW1WyAjIMqB+KCyoZy8PbpDhzf
	XAuLFc/e+fq9gah2F5MzbRyHvz+KPEbAcmUXh1zSStr5X3RSVyhC0+HBUH+rZR7glo4A9TEAduo
	h3LBSivnQ50R0NBDXFaUp2rATdlGRv48j7KLgW5qWZCuoD4CvbD2/cX8O7GDOiQaSo+XWhPTQN+
	kHnVJXoos8afpo1B6OxmujRc5DIfkHf/MOpyK9nEaSAEBmJ71f91ZVJfp0+9m99/FR/jtIvcfqx
	j46t/UhtinfymEFi6fCLuDAcdV6HnniHBgIbTvaH646LQhGgjPXby8Wftsbruat3RcZdRVMzEcb
	FtB4/lD2NufAHuJ9fmt9ZNb/RHMSk5s0behm92Ezrjy9AuishkZ5nCzku21VBD0Kdjx+hI/mtoc
	IZnhl188Ohitj+w2gpWeLbRTg1mzXnevh8Sw==
X-Received: by 2002:a05:7022:f87:b0:12d:ce60:cb52 with SMTP id a92af1059eb24-1343677c21cmr4095334c88.18.1778732755696;
        Wed, 13 May 2026 21:25:55 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb93f3sm2645323c88.3.2026.05.13.21.25.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 21:25:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 13 May 2026 21:25:54 -0700
Message-Id: <DII44YQHQRAQ.1BOWF2JZ2RY5N@nexthop.ai>
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Guenter Roeck" <linux@roeck-us.net>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>, "Alexandru Tachici"
 <alexandru.tachici@analog.com>
Cc: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>, "linux-rtc"
 <linux-rtc@vger.kernel.org>, "Guenter Roeck" <groeck7@gmail.com>
Subject: Re: [PATCH v3 4/5] hwmon: (pmbus/adm1266) replace probe-time RTC
 seed with rtc_class device
X-Mailer: aerc 0.21.0
References: <20260512-adm1266-v3-0-a81a479b0bb0@nexthop.ai>
 <20260512-adm1266-v3-4-a81a479b0bb0@nexthop.ai>
 <045f1907-0180-46df-a123-cd0ce349e86b@roeck-us.net>
In-Reply-To: <045f1907-0180-46df-a123-cd0ce349e86b@roeck-us.net>

On Wed May 13, 2026 at 7:14 PM PDT, Guenter Roeck wrote:
> On 5/12/26 11:56, Abdurrahman Hussain wrote:
>> The driver currently writes the device's internal RTC at probe with
>> ktime_get_seconds(), which returns CLOCK_MONOTONIC seconds since boot
>> and is not a wall-clock value. The resulting timestamps embedded in
>> blackbox records are therefore meaningless across reboots, defeating
>> the cross-reboot record-correlation use case the field exists for.
>>=20
>> Switching the seed to ktime_get_real_seconds() does not actually fix
>> this: at probe the system wall clock may not yet have been set (no
>> external RTC, no userspace NTP), and seeding unconditionally also
>> clobbers whatever valid time the ADM1266 retained across a warm
>> reboot.
>>=20
>> The data sheet (Rev. D, p. 22) recommends "frequently send the time
>> stamp to the ADM1266 to synchronize the UNIX time and reduce the time
>> from drifting" when running on the internal oscillator. The clean way
>> to expose that policy is an rtc_class device backed by SET_RTC, so
>> that userspace tooling (hwclock, chrony, systemd-timesyncd) can drive
>> the re-sync against /dev/rtcN once it trusts the system clock - with
>> no driver-specific sysfs ABI.
>>=20
>> Drop the probe-time seed and adm1266_set_rtc() entirely. Add an
>> rtc_class device whose ->read_time and ->set_time callbacks read and
>> write the SET_RTC frame. The rtc_class API is second-precision, so
>> the SET_RTC fractional-seconds bytes are always written as zero.
>>=20
>
> This doesn't just set the RTC time, it also acts as a real-time-clock.
> That seems undesirable, since it isn't really a real-time clock.
> It would also be the first (pseudo) rtc residing outside the rtc
> subsystem.
>

Agreed -- calling it an RTC overstates what the chip does.  The
register is a 32-bit seconds counter seeded via SET_RTC and stamped
into each blackbox record.  No battery, no alarm, nothing the RTC API
normally implies; treating it as an rtc_class device was the wrong
fit.

> It seems to me that there must be a better solution. The rtc subsystem
> needs to be involved in this discussion.
>

Would you prefer I drop anything RTC-shaped from this driver
altogether and reach for something else (e.g. a read/write debugfs
file under pmbus/<dev>/, consistent with the other debugfs entries
this series adds), or would you rather I post a separate thread to
linux-rtc asking how a device like this should expose a host-driven
seconds counter and wait on their guidance before respinning?

The datasheet's intended use is for the host to frequently send the
current timestamp to the chip, so the value stamped into each blackbox
record reflects wall-clock time at the moment of the event.  Either
direction works for me; my mild preference is the debugfs path since
it lets me close the loop without holding up the rest of the series.

> Note - as sent separately - that making this driver dependent on
> the RTC subsystem (as would be required by this patch) is unacceptable.
>

Understood -- I'll drop the rtc_class approach in v4 either way.

Thanks for the quick feedback,
Abdurrahman
