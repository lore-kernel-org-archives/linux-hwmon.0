Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B8DF209696;
	Sat, 25 Jan 2025 06:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737787613; cv=none; b=nemBMwHMSw9uUfi20GMcR+iPsP6nxVV0TGc7hiJ+e0vBBTpvDsyMarHrwKHLVbMATaOJFKX2ltjJ0Y8i+W9gWT8DV7q2br/1wsedlVVsZ9nUAM21Xm2h7yI3/AfnSkLsgzLBnM7aXvJIG2JD85Pac4CSjni0RN6QhcVvZavCAVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737787613; c=relaxed/simple;
	bh=TlYBvxSEmeZxxXLvq/FH5xBfExh/1Il55iDpuFK0taA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UhXW3MGm0fTpdxrhPyVwQeUNNSGXBJOy8AanXCBLbIiHeQOyp6TGZ0g0OJ6gKWQKGVRs8UcSGJY2MuaZPYp/zaG+v1HOOObmebxCmf2cyuVhonc7xQGoHBkNq7rHDQUh2xISV3lWeBIoX7RYQ9yFrSkGdjY9QewlZc8m4+wPb98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=bU+mSz77; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="bU+mSz77"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=2+Gez
	wAuC0TIWv5b3TpjjkNBdQsYgqc/av58BWSgrT4=; b=bU+mSz77V28YRj5zHUJ8H
	yu5NwBQIuGLnd8KfYU4T1otuAyIFCAReeGs6yvjzYOSKshTav7kWPcXiPJR7f+nE
	+o2zJr+cR/Qh8cqzhfF0ymW8R/gMzahDwobQ2pc8Ra6BYrKtw8Jfa3Yj4RowVx68
	WaYFxVoXOweOG3RgFH8kGA=
Received: from silergy-System-Product-Name.silergy.inc (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wBHtPqxiJRnLj1HIA--.30509S4;
	Sat, 25 Jan 2025 14:46:10 +0800 (CST)
From: Wenliang Yan <wenliang202407@163.com>
To: linux@roeck-us.net
Cc: christophe.jaillet@wanadoo.fr,
	conor+dt@kernel.org,
	corbet@lwn.net,
	jdelvare@suse.com,
	krzk+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	wenliang202407@163.com
Subject: Re: [PATCH v4 0/2] hwmon:(ina238)Add support for SQ52206
Date: Sat, 25 Jan 2025 14:44:32 +0800
Message-ID: <20250125064432.1242713-1-wenliang202407@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <c7c3d35a-e8a5-40ee-9b47-c22d87fa7f71@roeck-us.net>
References: <c7c3d35a-e8a5-40ee-9b47-c22d87fa7f71@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBHtPqxiJRnLj1HIA--.30509S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7ur1UXw1fZw18urWUuF47CFg_yoW8uF4rpr
	Z3GF4FkFyUGr17XrZa9a1avryjkan5JF1xWFn8Jw1ruF1Uu3WIq3y2kw1Y9F4DXr93uFZY
	vF1IqFn3GF4rArDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUAxhdUUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/1tbioxbf02eUTE5pQQAEsk

At 2025-01-25 13:01:36, "Guenter Roeck" <linux@roeck-us.net> wrote:
>On 1/24/25 19:02, Wenliang Yan wrote:
>> Add support for Silergy i2c power monitor SQ52206 to the ina238
>> driver as those two are similar.
>> 
>> Signed-off-by: Wenliang Yan <wenliang202407@163.com>
>> ---
>> 
>> Add new chip SQ52206, the datasheet depends on
>> https://us1.silergy.com/cloud/index/uniqid/676b659b4a503
>> The password is fx6NEe.
>> 
>> Changes in v4:
>> - addressed various review comments.
>> - Link to v3: https://lore.kernel.org/linux-hwmon/20250117082017.688212-1-wenliang202407@163.com/
>> 
>
>Your "change logs" are equivalent to "made changes" and completely pointless.
>As consequence, I'll only handle your patches if and when I have nothing else
>to review since I'll have to figure out myself what you changed and if you
>implemented the feedback. I don't really hve time for that, so please do not
>expect that I'll apply this series anytime soon.
>
>Guenter

Thank you for your reply.

Okay, I understand. I will pay attention to adding detailed modifications for
your review in the future. There are two main changes in the V4 version:

1) add 'Acked-by: Krzysztof Kozlowski' information to PATCH 1.

2) formatting adjustments have been made to ina2xx.c in PATCH2 with
Christophe JAILLET's comments.

>> Changes in v3:
>> - addressed various review comments.
>> - Link to v2: https://lore.kernel.org/linux-hwmon/20250113035023.365697-1-wenliang202407@163.com/
>> 
>> Changes in v2:
>> - Explain why sq52206 compatibility has been added to ina2xx.yaml.
>> - addressed various review comments
>> - Link to v1: https://lore.kernel.org/linux-hwmon/20241224063559.391061-1-wenliang202407@163.com/
>> 
>> Wenliang Yan (2):
>>    dt-bindings:Add SQ52206 to ina2xx devicetree bindings
>>    hwmon:(ina238)Add support for SQ52206
>> 
>>   .../devicetree/bindings/hwmon/ti,ina2xx.yaml  |   4 +
>>   Documentation/hwmon/ina238.rst                |  15 ++
>>   drivers/hwmon/ina238.c                        | 209 +++++++++++++++---
>>   3 files changed, 195 insertions(+), 33 deletions(-)
>> 

Thanks,
Wenliang Yan

