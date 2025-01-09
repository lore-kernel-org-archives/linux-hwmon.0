Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9D551474A9;
	Thu,  9 Jan 2025 08:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736411376; cv=none; b=hf9Fa22kpBpHlCPmS7F568ul7LC8/T5Rjhudr13bh/4Ofb4zllQ4SOqdk8UWq6t6RMD92BCiYYv/1PROjspt9YxSs9Nodk185QR5ckW6eoAjvNzj6r+Cdo0ttRHDC5qnBdU2ew7B7wKNNQsH5IuMZ21spU+6bzOkXR6XZmGuuA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736411376; c=relaxed/simple;
	bh=UpbSePfstfrp/6wEgb8RztdKWfui9cMd3AagZlmCnFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AbAthUjRzfwA4RD4uufYgnDzRSAmsF0mCw698VMi/fHDwYI/X44AYrT3+zCoIVEK+mfysfPjWJhhJZz8/UnfP91xxJ4YRmyaVUSVt7TCp76J88zlyo2uY/EpSd2BMidaXY1KT59ig+7dXLz5cOHqQKmjlke1TieYOwgTMR1NmPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=AXLsHX3h; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="AXLsHX3h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=BDqOP
	gSUP3+b245ejO/DQwuuKV0SZcIhL5zU/cTxllE=; b=AXLsHX3hfKJV7gn7RdF7h
	8Ea4NHOoyMlAKUnKC0DuvB84673sQtBx4gLOsX9kaN2ns/pjKgHStJZfS9Yu7WrR
	iBzld/xqBBcnshtWpFN+wwy7JENBaRC0hjkdbBNhVmWTV5Y36md7toJ0VPRfZG8G
	VCxMK3gEcDVBL321x9Nl5w=
Received: from silergy-System-Product-Name.silergy.inc (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wAnoCuriH9nIhp3Ew--.21794S4;
	Thu, 09 Jan 2025 16:28:28 +0800 (CST)
From: Wenliang Yan <wenliang202407@163.com>
To: linux@roeck-us.net,
	krzk@kernel.org
Cc: conor+dt@kernel.org,
	corbet@lwn.net,
	devicetree@vger.kernel.org,
	jdelvare@suse.com,
	krzk+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	wenliang202407@163.com
Subject: Re: [PATCH 3/3] dt-bindings:Add SQ52206 to ina2xx devicetree bindings
Date: Thu,  9 Jan 2025 16:28:12 +0800
Message-ID: <20250109082812.136268-1-wenliang202407@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <f96bdc15-1308-4b9e-9fe4-e92505eb9d8b@roeck-us.net>
References: <f96bdc15-1308-4b9e-9fe4-e92505eb9d8b@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAnoCuriH9nIhp3Ew--.21794S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxJrWkCF47CF1fKFyUKr4rKrg_yoW8Xw1rp3
	yxAFWDtF4Fqr12q3yqq3W8Ga1jqw4kCayUWF1DtF1j9w1vgFySqFWfKFn5uFn5Xr1fZFW7
	WF1vg34ftrWIvaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUfl1kUUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/1tbiNQrP02d-h1ccvQAAsK



At 2025-01-08 22:18:38, "Guenter Roeck" <linux@roeck-us.net> wrote:
>On 1/7/25 23:06, Krzysztof Kozlowski wrote:
>> On 07/01/2025 14:01, Wenliang Yan wrote:
>>>>>   Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml | 1 +
>>>>>   1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
>>>>> index 05a9cb36cd82..f0b7758ab29f 100644
>>>>> --- a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
>>>>> +++ b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
>>>>> @@ -20,6 +20,7 @@ description: |
>>>>>   properties:
>>>>>     compatible:
>>>>>       enum:
>>>>> +      - silergy,sq52206
>>>>
>>>> So it is compatible or not? You said same bindings, but not compatible?
>>>>
>>>
>>> What I mean is that SQ52206 is compatible.the datasheet depends on
>> 
>> 
>> Then compatibility should be expressed in fallback, but OTOH, your
>> linked changes suggest these are not compatible. Confusing commit msg.
>> 
>
>It is 'backward compatible' with additional features. That means it is not
>'compatible' in devicetree terminology.
>

Thank you for your explanation.
Although SQ52206 has added some new features, it has not affected the
hardware properties.The properties described in the ina2xx.yaml are
applicable to the sq52206 hardware.
So I will just add the sq52206 compatible to the ina2xx.yaml.yaml
from that series. Would that be fine from your side?

Thanks,
Wenliang Yan



