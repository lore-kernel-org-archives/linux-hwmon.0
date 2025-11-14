Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E982EDD7D;
	Fri, 14 Nov 2025 07:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763106173; cv=none; b=auvPzneljwkQBW/d2HoNQEq9NCmB3SU8xC1yNq4Ztj9+179hw+dYxAM/9aRIGQp1OjXxi3QiCyqitlA3OWc62mNeCpMtUeslciiwYgc48vk87EMv77Xt4aR0sru4CHoOwTC4eh7uF5x0yaf8KSSUUXCNvL/cDAt26k+3UbHIHWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763106173; c=relaxed/simple;
	bh=RJWOcXTviPu4i/X22CoYfKTcY0vpRjUBt82Suo5qKes=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=YOW7YDyVQLtBPbSB6WmhJyUFzbAbCm2oWpxBtclPQ9hwKCl+b0XNK/U1vCeEdkUDJA0ROLz4w8Vk7gwsJEgvdJwIXOHi0hWGg5ZwtLFs4jhwMqvFhWALt+khm0W8wUQnR+vWWmA8sMArTr0jxW37t1fHEaYwn2iH0LyQrm4MWV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=bbbxPXV7; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="bbbxPXV7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=IoWtqzKVXo6FmrE
	fBjsDpD5FkqNtFtVHd+0Qu0u979Y=; b=bbbxPXV7a5vQ1aeJC4hQOv/i2KArrBm
	mY1l2Z99cfAVFQLlBSWDi/fU3S3y2DjvTRHHXJWoWWn3M8bfx9TwiRb5smBKNlo8
	l7VmnTtwZRpsmkqWwUT5KC4fUUhMMBrGsK7spHbsGsEXeWoRZT3ies+G0yD/f+8A
	zzQ8/of1UXRk=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wBHhRlM3RZpKI+xAA--.34S2;
	Fri, 14 Nov 2025 15:42:07 +0800 (CST)
From: Wenliang Yan <wenliang202407@163.com>
To: linux@roeck-us.net
Cc: christophe.jaillet@wanadoo.fr,
	conor+dt@kernel.org,
	corbet@lwn.net,
	devicetree@vger.kernel.org,
	jdelvare@suse.com,
	krzk+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	wenliang202407@163.com
Subject: Re: [PATCH 1/8] dt-binding:ti,ina3221:Add SQ52210
Date: Fri, 14 Nov 2025 02:41:47 -0500
Message-Id: <20251114074147.6941-1-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <79da1c83-0529-48cb-a20d-23512f68397e@roeck-us.net>
References: <79da1c83-0529-48cb-a20d-23512f68397e@roeck-us.net>
X-CM-TRANSID:_____wBHhRlM3RZpKI+xAA--.34S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7GrW3uF4UCF1xtF4DXr47Arb_yoWkJrgEkw
	s7Zr9rAr48JFW3ua4DGF9xAr98ta1UXFs3JF10vFW5Zr18A3y3Wr4ktw4xJ347JFZ8Aw1j
	vrWUGFW0y3W7AjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VU16uWtUUUUU==
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/1tbibgUG02kW0zz4sgAAsk
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

At 2025-11-14 01:18:30, "Guenter Roeck" <linux@roeck-us.net> wrote:
>On Tue, Nov 11, 2025 at 03:05:45AM -0500, Wenliang Yan wrote:
>> SQ52210 adds power attribute to report power data, and implements
>> read/write functions for this purpose.
>> 
>> Signed-off-by: Wenliang Yan <wenliang202407@163.com>
>> ---
>>  drivers/hwmon/ina3221.c | 79 ++++++++++++++++++++++++++++++++++++++---
>>  1 file changed, 75 insertions(+), 4 deletions(-)
>> 
>> diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
>> index abb6049c8eab..ea01687ad1fa 100644
>> --- a/drivers/hwmon/ina3221.c
>> +++ b/drivers/hwmon/ina3221.c
>> @@ -348,19 +348,16 @@ static const u8 ina3221_in_reg[] = {
>>  	INA3221_SHUNT3,
>>  	INA3221_SHUNT_SUM,
>>  };
>> -
>>  static const u8 alert_limit_reg[] = {
>>  	SQ52210_ALERT_LIMIT1,
>>  	SQ52210_ALERT_LIMIT2,
>>  	SQ52210_ALERT_LIMIT3,
>>  };
>> -
>>  static const u8 alert_flag[] = {
>>  	F_AFF1,
>>  	F_AFF2,
>>  	F_AFF3,
>>  };
>> -
>
>Please refrain from making such cosmetic changes.
>

Understood, I'll make the changes.

Thanks,
Wenlaing Yan

