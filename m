Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F961EF0B9;
	Fri, 14 Nov 2025 06:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763102715; cv=none; b=JRJjvNLKTLlz7UxBtrcSg/sYVo8ho2TUEaFiEE5stGfPqbr9MhdonTKP6jOQdblbZV5LqbR990H/NNLw6nFIS0gC2xOau/XfGe4G6Bbc7N9F1wSbltEMLKmrgummQxasLFLbiSIYiG0d13UDyzEXArYaFc4m3YXYKu688Jjxm3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763102715; c=relaxed/simple;
	bh=1r3q3oUpTFJTCljbbYXYkDgntLmSg9ISpcZ3JNfGOcQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=Uyz6po5okI6S97+rGOUKQYfa6wNvaczsOiVw/CA5XCkYe2bMZ7mb/Ye+Doc2GOjMAwRlEI+hu+kPrXfcLV0T4W8MwGY6u74325P9YV4n0Ke07qG5fOm713lssPIsGYGs/KoyY48cJDKOqgdSMfXZdcmjNObfbpSiQlcWpm1ehSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=fGrtQUyy; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="fGrtQUyy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=n9BlnlJCKDmKiXa
	btgJAS1QyLzEeWowbtkJ8ygX1New=; b=fGrtQUyyVvA1WIOk8Wn5LQmTbezJ5Qm
	x3e5404nZDJCxPnNJkpvyBadfNIbpKcT3R85SjUl/wsTg+J5Kl/MY1Et97BDvcvJ
	nFHRDE8enW7Of+eoo2F1GCmJKBxGVcF4gjgcXuCnJcyTt9INQRB68vXkt+/gdbIB
	VM1CMIty/EJw=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3d0nJzxZp2nKoAA--.94S2;
	Fri, 14 Nov 2025 14:44:27 +0800 (CST)
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
Date: Fri, 14 Nov 2025 01:44:13 -0500
Message-Id: <20251114064413.6105-1-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <50cb21bc-55e7-4bf3-9d05-0cbe10af46aa@roeck-us.net>
References: <50cb21bc-55e7-4bf3-9d05-0cbe10af46aa@roeck-us.net>
X-CM-TRANSID:_____wD3d0nJzxZp2nKoAA--.94S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGFy8Kw4fGw4rAw15Xw1DZFb_yoW5Wr1Upa
	yIkFWUtF1IgryfJ3yS9F48Cr1rtws7Xr47Gr1DG3yIv3yDAr9IvrZ3Kw1UtFy7XrZ3ZFW2
	qayjgF15uw4DAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JjTc_fUUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/1tbiGQgG02kWy8xt7AAAs9
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>


At 2025-11-13 10:03:01, "Guenter Roeck" <linux@roeck-us.net> wrote:
>On 11/11/25 00:05, Wenliang Yan wrote:
>> Add a compatible string for sq52210, sq52210 is forward compatible
>> with INA3221 and add alert register to implement four additional
>> alert function.
>> 
>> Signed-off-by: Wenliang Yan <wenliang202407@163.com>
>> ---
>>   .../devicetree/bindings/hwmon/ti,ina3221.yaml    | 16 +++++++++++++++-
>>   1 file changed, 15 insertions(+), 1 deletion(-)
>> 
>> diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
>> index 5f10f1207d69..0fae82ca3ee1 100644
>> --- a/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
>> +++ b/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
>> @@ -12,7 +12,9 @@ maintainers:
>>   
>>   properties:
>>     compatible:
>> -    const: ti,ina3221
>> +    enum:
>> +      - silergy,sq52210
>> +      - ti,ina3221
>>   
>>     reg:
>>       maxItems: 1
>> @@ -77,6 +79,18 @@ patternProperties:
>>             exclude specific channels from the summation control function.
>>           type: boolean
>>   
>> +      alert-type:
>> +        description: |
>> +          The SQ52210 features a configurable alert function with four
>> +          types: SUL, BOL, BUL, and POL. Each channel can be configured to
>> +          select one of these types to enable the alert function. This alert
>> +          function can operate concurrently with both Critical and Warning
>> +          functions.
>> +
>> +          The configuration must use numerical values 0 through 3,
>> +          0 corresponds to SUL, 1 to BOL, 2 to BUL, and 3 to POL.
>> +        enum: [ 0, 1, 2, 3 ]
>> +
>
>Per datasheet, each of the alerts can be enabled independently. It is possible
>to enable SUL, BOL, BUL, and POL on each channel at the same time. This is not
>possible with the above property since it only permits enabling alerts for one
>of the alert sources on each channel.
>
>Also, I am not sure if it makes sense to have this as devicetree property.
>It is not really a board property. It might make more sense to tie enabling
>the alerts automatically if a channel is enabled and a limit is set for a
>given channel.
>

The "If multiple function are enabled, the Alert Function with the highrst
signifivant bit position(D15-D4) takes priority and responds to the Alert
LImit Register" described on page 21 of the datasheet refers to the fact that
when different trigger sources are enabled simultaneously, only the highest
priority trigger source takes effect (SUL > BOL > BUL > POL).Therefore,
essentially only one type of alert can be active per channel.

Indeed, it is unnecessary to configure the alert-type at the board level.
I will modify this content and conduct testing before the next submission,
and also remove the alert-type support in Patch 3.

Thanks,
Wenlaing Yan

