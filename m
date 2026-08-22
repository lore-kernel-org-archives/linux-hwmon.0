Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F6825B083
	for <linux-hwmon@vger.kernel.org>; Sat, 22 Aug 2026 08:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787386045; cv=none; b=O90SouFiqte4qO+6GXfxfoSYOjoy/UUqGpASJQsW1X4VYGtYUbQjV8tJOsyYNwDmcjnthV4Hdkew1l9DiVeYsLrI/AvQgB+AXMMjrp38/jg7BXaQmKiMMguqWSizEEBAM4qNDbMNdaUTBUF66UF752xG9lTPn837xtN5F0QJHDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787386045; c=relaxed/simple;
	bh=YHCQPbeVa/qsJYN1kGy1DK69Sy793FGSalaVd1bq4a8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=JS7hV12/lc2pqtpSzb+jCgmH3zuMmQL9KboIIQ04sTTqEmVvwJkqyT6QO6lilMNVhpfZENeHDqigOdbraLhlNR7lW6g1yDC1A3YpQ/69ax6RjxohO8V1CjqlxNZReR766sEjlSmc/5VCI/JnfcjWJS273AsEYvOGaK4XprwsqNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oz2Z8KMH; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oz2Z8KMH"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-698ae09e356so2785885a12.2
        for <linux-hwmon@vger.kernel.org>; Sat, 22 Aug 2026 01:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787386042; x=1787990842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IiLtBWKTPWNJSp/wkwtBEljpdTSGgD9pmHCNo8TEl9s=;
        b=Oz2Z8KMHTLx5soduir4uU7OZK1iLDas0Gtz0zFRBCSUm3r1k8cOqF5qAZBQAzZMeUs
         ZivmJsKK0v3rLVZTu42/EmpELB+NMNJ1MNJlDJUOZPV1gBG0mJLtOfMY2w53oXcxXYwH
         hoRemuFWfhHqV0FXKxSQShSgmj23SpQXTJjFjqnj5aD8YUQs02mXe6CocjbUZiaceZJm
         QGkyTSeNHH7FTA2Id5FPTHHSx65vw67p41w6N0uxtY4AIfSzhLa6e8WzS1sh4b9QKiep
         4hs9k+tDFSsJ1GXoyRgj5T7+r+i6Jre+1M0AiBQQxHhaHiOaKLrwL9puEUkOJWdiRghz
         MasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787386042; x=1787990842;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IiLtBWKTPWNJSp/wkwtBEljpdTSGgD9pmHCNo8TEl9s=;
        b=Xg2777bgb6V9YZEU4HbOIhMoPg0dk3ozu3dZOPcTISKAzIfXpOmlV8tv8ym/+ca2ic
         gX1CpnLOhJacO4MoNgiVGgNtFzhb0mjhZQHfaD+92kiA9smViXP3O7anTJvslxlVsMcT
         3fw6zyUz2PlPxdZdLlsIStF+rLjde3SqUvxr+NNB/NQqNRlOFZQD92JgPM2IGbyp8DyV
         /wNgD9fH5xY7y2C+ATN8k5u6hWAX3LeyP/aGRo2Ux97LMNjj9GWgB1pTrT09QG8jVhwq
         NEzD07Sn8eWYW+oI6P+nH7zuSaQFtsX8Xm+VUavm23kJ7IgWCxpWESkFV4BIcFfb5Um8
         2G5w==
X-Forwarded-Encrypted: i=1; AHgh+RpMZPUlluJrdMbwrKFZDVcvpmpHU9K6Q2jl9HPlm+ZUIs0lXvoZk4p7fV57vEJzOsq58+lzE8s755Ve9w==@vger.kernel.org
X-Gm-Message-State: AFuF++kX9kVjakGTsXNyEL0jmJ+FxiBq+fLqd/G7mCaeyjIWS/37LXCp
	gdAdF41uIeQO+rIALq87cPoGc/LPhAfETnd+RHmhJ78i/GVoA3p9EpHX
X-Gm-Gg: AR+sD11WWakzaN3C+hyzUhH1Ihpr8bSEcdfyUGFYvnzgpVP3asH2CwNzKBeiTsaJ8Pc
	t2gXVPl6YkaJnMK39D/XB8OOuy2zYzKunM+dqnJ7cS+B2azYmHh7nnu8WdCCXkmx4Hmg8O6H3gA
	JiF9MFJzUoME9Lex/asnjU8zxeu8QEYsyOeOhS44ZUxAr71iIBvdS+hCmxPYFqms5LMVYG1RnzQ
	1RSTP6MAKixDKg5zXAvuuf4xUZAuXflR+TX5khEHa6JGF3arIwT8wOqrCANpyI/UrBa4Wd3E0Ce
	KzRAWtFMoHZZ0zOXzXfjxQaUQ+Jx/I9k17GWiY4iPxosUCMpaEyOI1w4M0WGP9DpJdAJy1RybWT
	E+aorxGgEeuKYy+AeuichVpurDpAWNluB1si7gtU0XJZFwo342tDTneCNlHRbi3m7xZc9DmrVbM
	6rlw8fyBzE2h4CtkvK8ILX0vxvE8P1iMl7zsRujBXJ0InygxW5VjpLxLMCg9sFmCg3VXEdDmQ8A
	l20wECbxpzEBP17U4ie8A70HLJQLBk2HneB2DgcxAYn
X-Received: by 2002:a05:6402:4348:b0:6a4:21c6:1d14 with SMTP id 4fb4d7f45d1cf-6a42eeb21b4mr15003960a12.0.1787386041628;
        Sat, 22 Aug 2026 01:07:21 -0700 (PDT)
Received: from [192.168.0.32] (cable-178-148-247-5.dynamic.sbb.rs. [178.148.247.5])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff178289sm10950928a12.30.2026.08.22.01.07.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Aug 2026 01:07:21 -0700 (PDT)
Message-ID: <2aabcaaa-f6b6-4375-a773-690305b1979f@gmail.com>
Date: Sat, 22 Aug 2026 10:07:20 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Aleksa Savic <savicaleksa83@gmail.com>
Subject: Re: [syzbot] [hwmon?] KASAN: slab-out-of-bounds Read in aqc_raw_event
To: Guenter Roeck <linux@roeck-us.net>,
 syzbot <syzbot+9ee5f5dc18673d6b2f37@syzkaller.appspotmail.com>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, me@jackdoan.com, syzkaller-bugs@googlegroups.com
References: <6a891232.91706f20.16b6e3.02b0.GAE@google.com>
 <1506eaff-db5e-407a-a09c-d7a6b070c9cb@roeck-us.net>
Content-Language: en-US
In-Reply-To: <1506eaff-db5e-407a-a09c-d7a6b070c9cb@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/22/26 6:02 AM, Guenter Roeck wrote:
> Aleksa,
> 
> On 8/21/26 20:06, syzbot wrote:
>> Hello,
>>
>> syzbot found the following issue on:
>>
>> HEAD commit:    e1e6e541c5c9 Merge tag 'thunderbolt-for-v7.3-rc1' of 
>> ssh:/..
>> git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/ 
>> gregkh/usb.git usb-testing
>> console output: https://syzkaller.appspot.com/x/log.txt?x=16086e79580000
>> kernel config:  https://syzkaller.appspot.com/x/.config? 
>> x=8bdeea7ee6735f91
>> dashboard link: https://syzkaller.appspot.com/bug? 
>> extid=9ee5f5dc18673d6b2f37
>> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils 
>> for Debian) 2.44
>> syz repro:      https://syzkaller.appspot.com/x/repro.syz? 
>> x=14737679580000
>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15a22549580000
>>
>> Downloadable assets:
>> disk image: https://storage.googleapis.com/syzbot-assets/3b0a1f8e6a1f/ 
>> disk-e1e6e541.raw.xz
>> vmlinux: https://storage.googleapis.com/syzbot-assets/f98d855e85e8/ 
>> vmlinux-e1e6e541.xz
>> kernel image: https://storage.googleapis.com/syzbot-assets/ 
>> db2c3a41df6d/bzImage-e1e6e541.xz
>>
>> IMPORTANT: if you fix the issue, please add the following tag to the 
>> commit:
>> Reported-by: syzbot+9ee5f5dc18673d6b2f37@syzkaller.appspotmail.com
>>
>> ==================================================================
>> BUG: KASAN: slab-out-of-bounds in get_unaligned_be16 include/linux/ 
>> unaligned.h:48 [inline]
>> BUG: KASAN: slab-out-of-bounds in aqc_raw_event drivers/hwmon/ 
>> aquacomputer_d5next.c:1345 [inline]
>> BUG: KASAN: slab-out-of-bounds in aqc_raw_event+0x213e/0x25d0 drivers/ 
>> hwmon/aquacomputer_d5next.c:1327
> 
> The problem is that syzkaller sends a bad (short) report.
> aqc_raw_event() needs to validate the report size and bail out
> if it is short. The fix should be straightforard if it is known
> what the minimum report size is. D5NEXT_CTRL_REPORT_SIZE ?
> 
> Thanks,
> Guenter

We do know sizes of control (setting) reports since we send them through 
priv->buffer, but aqc_raw_event() gets sensor reports and their length 
can vary per device. I don't have an exact list for all devices since I 
don't have them all myself. We'll need to verify that what we receive in 
aqc_raw_event() is >= the minimum offset we want to read sensor values from.

Thanks,
Aleksa
