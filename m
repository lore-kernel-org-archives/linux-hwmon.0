Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795860232;
	b=GqJka0C5YRWXYaSDw0BalV+Zy7rntqu6T3Dg+GLx6aJJctD0dUtlxi60/jrR99SaHQFd
	 f/NNrxlHbHn6AnZUAOSA32ze45bbCt02l636qDpCnZy8iv0RMp0uUTwsWtUjSVaFQ6K+K
	 7D1d5+DGPGh2VjFTkBLhCjXiWaDO6kEXJTcgp5Y5kU4GVFMfaZQtso2aQK0Z1HeTp+S9A
	 8vZG6NG/gT/TdHu0NRRIsAc9MRs/qUWo8TfWweIYKZTpkXA7PMmmEzDY0xXIyuIKzq4ks
	 TsU2ZUuHp2E/AXvNZ3St4EmJcs++CuyU/gMNuCkHEqP+MP2/JFkgJwb4n1qJ/kR4WRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795860232;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=sVFSGdTDmGn9kSHKwjHmdrZMfnLGzOGFumJLob1YCjo=;
	b=4zqPpegaA61Gx+w/HPk4vF5Yg0RfrODYLVlcPEzcPNaUIeUtAKFUo4GdR4DEQ7pBqQB+
	 81HF33S+EOIqfZZ8Ui5THmzYjr1mR6c1HZ2/7SNOcsfEBAkqxjr4hiNJP4YO8Tb8HIdvZ
	 eJ3++1RbQHC+48nAOFZixgf3SihAk2nrV5AlhaM4m6TLz5bzPgUB0ysktfyGZpaqvjT3q
	 QP8kl6i8Ve/2DYUyPZFulAWLGig3qiOdptLj9I8KsX+LC/b7LJgPb7zYSOwwZOC4UtMsQ
	 6/gV8JsRuXQn8RCU+yTRvgmIp2Jwvb87tK9WKHfVoTD0JSTeTkDnMyRVdFnBx372mHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=VRr+1C2U;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76343606A31C
	for <linux-hwmon@vger.kernel.org>; Sat, 28 Nov 2026 10:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76343606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=VRr+1C2U
Received: from eig-obgw-5006b.ext.cloudfilter.net ([10.0.29.217])
	by cmsmtp with ESMTPS
	id X4vDxgvOMyb4YXFHcxYuBJ; Sat, 28 Nov 2026 10:03:52 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id XFHbxRvq0SeuLXFHbxWzcr; Sat, 28 Nov 2026 10:03:51 +0000
X-Authority-Analysis: v=2.4 cv=NYvm13D4 c=1 sm=1 tr=0 ts=6b0aa707
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=H_-ZsajgQThrAGVFVt0A:9 a=QEXdDO2ut3YA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=sVFSGdTDmGn9kSHKwjHmdrZMfnLGzOGFumJLob1YCjo=; b=VRr+1C2U2RfT
	aD//ADQYsdr2w+youe6+gmrWANE6cXAX/uaN7hqbEwvncWxPLbN1CRLrfTJPm5PpGNxCsg5uTrFZv
	QJaH9K++A/9OqY0v/wzHTNy7WUIlh4L2z93suqNEf7jyZN7VX6NDalimifdy7ZRlfc8U4cSLW0l7Z
	deqMPURK3EKSNFaJZE059WJr4Oukd3tiJn/yg/8tztDi+vzVtyjg3leXfm8WpR7SEF7S/Li01lxU4
	LAJ8r75qsHO8xaxTg/i8w7hEYbWmP+7cRjtmuJOnOVbtgjJPCd8qCTH5WY0z0/BUqt4yfU1Bdgl/T
	vADuXfDNcqot2OlBmkeI0g==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:54006)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.2)
	(envelope-from <linux@roeck-us.net>)
	id 1xXFHb-000000017wY-0Z4u;
	Sat, 28 Nov 2026 15:33:51 +0530
Message-ID: <a01b1bf3-1228-43e8-8b4d-d3345f27ea4a@roeck-us.net>
Date: Sat, 28 Nov 2026 02:03:50 -0800
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] hwmon: (nct6683) Enable fan control on ASRock
 BC-250
To: Fabio Baltieri <fabio.baltieri@gmail.com>,
 Johan Dahlin <jdahlin@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alwyn Kik <alwyn@kik.pw>, Hamza Mahfooz <someguy@effective-light.com>
References: <20261111082838.1418051-1-jdahlin@gmail.com>
 <20261111082838.1418051-5-jdahlin@gmail.com> <awqYYqF0aIDLpcTg@google.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <awqYYqF0aIDLpcTg@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xXFHb-000000017wY-0Z4u
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:54006
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 7
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKOTPXH5WzrneltZklvOTwIs3rbzvpI9hY8qWu+HysMC/CMonZcsEXS9950374ZHJn6dbOkd6+3bnXz+YAlo2h1l+wGiVel7EK+asZFQieSphtaKmFPc
 H4ZYnPMVRdvcp9rHU5xhGeqoH20fRFifsnnPXc4BG10KlBY/x2LrW/+fXsTt0Un96YPR57qWhT4UZy6GxY5hGlWU22C7Tpy/ICzqW7poFkdV3qH3qo9YpGJy

On 11/28/26 01:01, Fabio Baltieri wrote:
> On Wed, Nov 11, 2026 at 09:28:35AM +0100, Johan Dahlin wrote:
>> The ASRock BC-250 (customer ID 0x162b) has an NCT6686D with the same fan
>> control registers as the B850 Steel Legend WiFi, and manual fan control
>> was reported to work there.
>>
>> Enable fan control for channels 0 to 7 on this board as well.
>>
>> Suggested-by: Fabio Baltieri <fabio.baltieri@gmail.com>
>> Signed-off-by: Johan Dahlin <jdahlin@gmail.com>
>> ---
>>   Documentation/hwmon/nct6683.rst | 2 +-
>>   drivers/hwmon/nct6683.c         | 3 ++-
>>   2 files changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/hwmon/nct6683.rst b/Documentation/hwmon/nct6683.rst
>> index 026515c35243..8e5cd1d7dcd2 100644
>> --- a/Documentation/hwmon/nct6683.rst
>> +++ b/Documentation/hwmon/nct6683.rst
>> @@ -59,7 +59,7 @@ fan reported by fanN_input.
>>   
>>   It is also supported on the ASRock B850 Steel Legend WiFi (NCT6686D,
>>   customer ID 0x164a), where pwm1 to pwm6 control the fan headers reported
>> -by fan1 to fan6.
>> +by fan1 to fan6, and on the ASRock BC-250 (NCT6686D, customer ID 0x162b).
>>   
>>   pwmN_enable selects the fan control mode:
>>   
>> diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
>> index 29fbf438c04c..f656b84ee8ac 100644
>> --- a/drivers/hwmon/nct6683.c
>> +++ b/drivers/hwmon/nct6683.c
>> @@ -1540,7 +1540,8 @@ nct6683_setup_fans(struct nct6683_data *data)
>>   		}
>>   	}
>>   
>> -	if (data->customer_id == NCT6683_CUSTOMER_ID_ASROCK8)
>> +	if (data->customer_id == NCT6683_CUSTOMER_ID_ASROCK8 ||
>> +	    data->customer_id == NCT6683_CUSTOMER_ID_AMD)
>>   		data->have_fan_ctrl = data->have_pwm & GENMASK(7, 0);
>>   }
> 
> Hey, just got a chance to test the v2 on my bc-250 and it works as
> expected, tested it on hwmon-next since this has already been applied.
> 

A formal "Tested-by:" would still be appreciated in situations like this.

Guenter

