Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C2381F03DA;
	Tue,  7 Jan 2025 13:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736254946; cv=none; b=VcCx4O6USVQt55pAhRp1NDapgpc8Qw7rzs25DacHAuMrAWdeMOw2z9jSMoyZs/6VYHD6O5m9PNvnY7dsNNuLRjq+iiKBhuu2f4Oz9Wk33Ijb/0J4fkj/mo0ZALc9NCcH4JBD+kb2qBxfm+jjfvdLkTaFFybPJTE/ciksSK5CiLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736254946; c=relaxed/simple;
	bh=Y7sXKw5CV4V8UKQfKrRulQFOJBZuINqaSjbOiSHgCEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LwaFxA1U27mzf724nihuWHte1naXjZwJcMOn79hwQRIZV+zOAOQkLolAdrWcdiAgyFrChzByUwTvdswh0sw33Bj4ZDVdYSUNQVpUe4yDA/iN1ybEy+r6IY1lbu30Uu20hflY1uCVx3LS20XCJal304nwjMa2cAU3111TXAt0aAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=QaX4f3UW; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="QaX4f3UW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=e1JAS
	AYJ1iCBuq+AbDaH7cLEQrJnmAbUewtv/wco0L0=; b=QaX4f3UWRb4qWKJttqNnn
	oS9KmHlpsSZ//7VxX4DdcthZpzg5LygASbG9c8fjJnsOn7agMbQQrypGNB3aFf7A
	0pEszo8FqX2mzIvcKZqoAP8s4p+UIQrPXZu2qeCAsDUXGoEFoP/rKaQn+xFqR8Ad
	1G37+jZJpg9fs3474ScApQ=
Received: from silergy-System-Product-Name.silergy.inc (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgDHNgylJX1n8m_VDQ--.45815S4;
	Tue, 07 Jan 2025 21:01:26 +0800 (CST)
From: Wenliang Yan <wenliang202407@163.com>
To: krzk@kernel.org
Cc: conor+dt@kernel.org,
	corbet@lwn.net,
	devicetree@vger.kernel.org,
	jdelvare@suse.com,
	krzk+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	robh@kernel.org,
	wenliang202407@163.com
Subject: Re: [PATCH 3/3] dt-bindings:Add SQ52206 to ina2xx devicetree bindings
Date: Tue,  7 Jan 2025 21:01:10 +0800
Message-ID: <20250107130110.25525-1-wenliang202407@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <srkay6cpegcxwx6q4jexs7iajydqqossfjctwoq3tctsanruxk@t44w4tbq3t5x>
References: <srkay6cpegcxwx6q4jexs7iajydqqossfjctwoq3tctsanruxk@t44w4tbq3t5x>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgDHNgylJX1n8m_VDQ--.45815S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar47urW5AryxKrWkKFy5twb_yoW8Ar13pr
	Z7CFWDKFyfur17X3y8t3WIgryUZw1DAF4SyF1DJw1Fqas09FySq39xKrn8JF1DArWfuFW3
	tFWvgw1xK3y0yF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUz5l8UUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/1tbiMBzN02d9GtLNegAAsX



At 2024-12-27 17:06:32, "Krzysztof Kozlowski" <krzk@kernel.org> wrote:
>On Wed, Dec 25, 2024 at 10:03:05AM +0800, Wenliang Yan wrote:
>> From: Wenliang <wenliang202407@163.com>
>> 
>> Document the compatible string for the Silergy SQ52206, this device
>> is a variant of the existing INA2xx devices and has the same device
>> tree bindings.
>> 
>> Signed-off-by: Wenliang <wenliang202407@163.com>
>
>Where is the rest of the patches? Why this is 3/3, not first, before the
>users (assuming there are users)? If there are no users, then that's a
>no...
>

Due to an issue with sending, this email has been lost outside the
thread pool. Attached is the link:
https://lore.kernel.org/linux-hwmon/20241224063559.391061-1-wenliang202407@163.com/
https://lore.kernel.org/linux-hwmon/20241225020256.439990-1-wenliang202407@163.com/

>> ---
>>  Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
>> index 05a9cb36cd82..f0b7758ab29f 100644
>> --- a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
>> +++ b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
>> @@ -20,6 +20,7 @@ description: |
>>  properties:
>>    compatible:
>>      enum:
>> +      - silergy,sq52206
>
>So it is compatible or not? You said same bindings, but not compatible?
>

What I mean is that SQ52206 is compatible.the datasheet depends on 
https://us1.silergy.com/cloud/index/uniqid/676b659b4a503
The password is fx6NEe.

>Best regards,
>Krzysztof

Thanks,
Krzysztof

