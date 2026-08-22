Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7CC3812EC
	for <linux-hwmon@vger.kernel.org>; Sat, 22 Aug 2026 14:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787408692; cv=none; b=hKexarVoiqOtT8IJDXGSZgEsrOZqaQRyEzxJCwMldWaAgC/plRadLu6GpKyKn1dub7BLjsli+56zdeJpwogEP3Su8iAMNKfFmouzbvYT2xObdNRj3eGIFiNfSKk+ZVDMxSgMvibBAyd9LCU/m9COjTj+IVfrlf0mMgmb4gWSa6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787408692; c=relaxed/simple;
	bh=eCKQa8sPvVLE0aadh+4FERv9QWuY2OaSqBKT6ngDEU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UwxNe8AcS7VKtfnHXu7wn8lY8U3/VELnt/BcqD4gtEegPvXW5Tkl/xMelGLTAnEbp6RxuDsb/4erxSMpyc2++ipoTxSGPtD9c6HVc6yztjkOBMzrd/hFZjA0+KlHKQKhFgJmLUdoKYZS7wkt8fet7jSfhGjCi1XxdhmoV/q6YRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZRZNVUgE; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZRZNVUgE"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ceb096e675so23534475ad.0
        for <linux-hwmon@vger.kernel.org>; Sat, 22 Aug 2026 07:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787408690; x=1788013490; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v01jTITvsIhpWfIBYLPGITnVsOTLsugEpP/iOU7pKDs=;
        b=ZRZNVUgEZaduFJEH9FnODqZj4I37AqTfwmqVsAuu7sFhmKoJsiSmMfq92Gt/5aGQPd
         tIY6htAAPv9xZE2HDCzf4pMb2MtDXeZtKiw+nR4wKTfgT0tCTgrXG0VxMtEriNYsO8jN
         x08Tv+fgdlne2ngY2lVMomTIoy3aaqSp69V+YZ7eWs50prokrr36OxY+OdhhhDwxrT3t
         qWBT1riwNn5Hhj8wjKIjJ+95a49nQ2NgEy2cGs55N8QMUY+UH9PnzPVRh5unBmOTOgDA
         smH9fJTh5oFaK52x4JjlHu2WkYd9jsN3JIACW3513weLf9VZwsHTlvbE7Nhh3paDzkdQ
         K6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787408690; x=1788013490;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v01jTITvsIhpWfIBYLPGITnVsOTLsugEpP/iOU7pKDs=;
        b=mwHQpc+4noTkeqX+gwAjFy0DqV9NhFHHS6VvpuPpbfQfNL64R/90QrUT+JriM/EQkk
         2sBPOEcn1UGcrPnyg8z1h9m76J8gZ/+/UZHu+01IjjjbJGK376tzgOuuCvmyV+5vq2qL
         1Zb/cvN22r6+p53K6LpGalpprq8vAQIgw5iy7PM/2cURyk6gMNj0HbbXbR7pguSr6fcS
         LKJ9YQwPeNOAVtq6kqR7dwMkoA1SXDd6IxfWy2IyLZycpFBF9cXSXpLoXCQAfMSNeSvG
         YNtYN+kRCueZq17VqADOU0FYjEufgT0XzPjFo6BLVzrBrJSywDrgaAiJxAmifXNy5KAn
         PsSw==
X-Forwarded-Encrypted: i=1; AHgh+Rp8poAJkX22yM0XuZagRwn78HAHTcuAVTHbCH2Mk10QGVdeXivdPmBL/87VeIr6bAaQTp27uEhB4IDJGA==@vger.kernel.org
X-Gm-Message-State: AFuF++mtrAEVh4Qo251WhfmRrtkglFkR7TaBi8CG0fvaMlTzFruVe6Aw
	kAMUx/uVHFRCfvdkXzmRFAYowZstvGbsL6j+QQxlVmOZwqoHneZhNWs+
X-Gm-Gg: AR+sD1216SqFuDEdqNRETw8yYHX8yVXPBUJ5ZTW2oLK/ZIATuwiQOY43GCdiY+addG/
	GUads0UEFj6JU41rjw9In/PY/72PI6o1EYlGl6BhK9VwzWVNdVVEIGJo/m9kYjoLXcmOfnuVsWL
	kADrdhjDz+DzOkAy9PQZ1s1IOUJJ5zyFPkGsGBj+ETqIhu7flq33rOtHq57OQR7PJ3ndOqtGJz+
	UIZsm+0ysAfuExt6cWQZj71093iC1AeGs4Kere5oDR+t6kKn/WxRA+zCah9Z+qDMpOSHHbz/PSD
	ueioiEk/3VEbEUEs6PVOMsxMm3ZLIgmywy0j6ZMVZOvszcKG/9oAQq0/3l1KE/ysiPgM4gWF6VN
	Rn9VqSJkCOpBkmUy8E+ySQ2Vn/RzbOkTGnUbO2Mhdu6K2mK1GBFr64WoOIoWbIiJQ+wBBAQ0prN
	rqH43lDN0nYmhJ4h0Byh2qAAN4aBbHRXZAlnRRVTopa45ngO4xt31hkud4xJDSw7aFsQUKj4k3j
	OOD6hfDyrCHTQoRx98AagF6elWqDJxNRLOE+w==
X-Received: by 2002:a17:902:ceca:b0:2d6:6953:717b with SMTP id d9443c01a7336-2d670c81ef4mr96366965ad.10.1787408689821;
        Sat, 22 Aug 2026 07:24:49 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f923f2c0sm11448999eec.30.2026.08.22.07.24.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Aug 2026 07:24:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <df9b143b-42fd-44a0-b6e7-d66b6ecd51fe@roeck-us.net>
Date: Sat, 22 Aug 2026 07:24:47 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [hwmon?] KASAN: slab-out-of-bounds Read in aqc_raw_event
To: Aleksa Savic <savicaleksa83@gmail.com>,
 syzbot <syzbot+9ee5f5dc18673d6b2f37@syzkaller.appspotmail.com>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, me@jackdoan.com, syzkaller-bugs@googlegroups.com
References: <6a891232.91706f20.16b6e3.02b0.GAE@google.com>
 <1506eaff-db5e-407a-a09c-d7a6b070c9cb@roeck-us.net>
 <2aabcaaa-f6b6-4375-a773-690305b1979f@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <2aabcaaa-f6b6-4375-a773-690305b1979f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/22/26 01:07, Aleksa Savic wrote:
> On 8/22/26 6:02 AM, Guenter Roeck wrote:
>> Aleksa,
>>
>> On 8/21/26 20:06, syzbot wrote:
>>> Hello,
>>>
>>> syzbot found the following issue on:
>>>
>>> HEAD commit:    e1e6e541c5c9 Merge tag 'thunderbolt-for-v7.3-rc1' of ssh:/..
>>> git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/ gregkh/usb.git usb-testing
>>> console output: https://syzkaller.appspot.com/x/log.txt?x=16086e79580000
>>> kernel config:  https://syzkaller.appspot.com/x/.config? x=8bdeea7ee6735f91
>>> dashboard link: https://syzkaller.appspot.com/bug? extid=9ee5f5dc18673d6b2f37
>>> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
>>> syz repro:      https://syzkaller.appspot.com/x/repro.syz? x=14737679580000
>>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15a22549580000
>>>
>>> Downloadable assets:
>>> disk image: https://storage.googleapis.com/syzbot-assets/3b0a1f8e6a1f/ disk-e1e6e541.raw.xz
>>> vmlinux: https://storage.googleapis.com/syzbot-assets/f98d855e85e8/ vmlinux-e1e6e541.xz
>>> kernel image: https://storage.googleapis.com/syzbot-assets/ db2c3a41df6d/bzImage-e1e6e541.xz
>>>
>>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>>> Reported-by: syzbot+9ee5f5dc18673d6b2f37@syzkaller.appspotmail.com
>>>
>>> ==================================================================
>>> BUG: KASAN: slab-out-of-bounds in get_unaligned_be16 include/linux/ unaligned.h:48 [inline]
>>> BUG: KASAN: slab-out-of-bounds in aqc_raw_event drivers/hwmon/ aquacomputer_d5next.c:1345 [inline]
>>> BUG: KASAN: slab-out-of-bounds in aqc_raw_event+0x213e/0x25d0 drivers/ hwmon/aquacomputer_d5next.c:1327
>>
>> The problem is that syzkaller sends a bad (short) report.
>> aqc_raw_event() needs to validate the report size and bail out
>> if it is short. The fix should be straightforard if it is known
>> what the minimum report size is. D5NEXT_CTRL_REPORT_SIZE ?
>>
>> Thanks,
>> Guenter
> 
> We do know sizes of control (setting) reports since we send them through priv->buffer, but aqc_raw_event() gets sensor reports and their length can vary per device. I don't have an exact list for all devices since I don't have them all myself. We'll need to verify that what we receive in aqc_raw_event() is >= the minimum offset we want to read sensor values from.

Agreed. We'll need something like min_raw_report_size per device.
It doesn't have to be accurate, just large enough to cover all values
that are extracted from the report. I think for D5 that would be
110 (D5NEXT_PUMP_OFFSET + 3), but I may have miscalculated it.

Thanks,
Guenter

