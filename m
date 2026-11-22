Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795310114;
	b=5VKEgm1qlHV4F5GSY6yZ095tNGx6d8BySD0gIrOiZ4bYk3eUDkYIP/QnNhho5Kopg4BD
	 YkxQ2P607Fbk5D/QwEGui2PaZj/SgpPEcIY5VUpeYJTOLl2tTRxFw9g8BYiknNUnAwNEs
	 HT/SCEcUZCfx5SuVwdVYV/tuHLTZVtdJsmBhzz/rvIL4L2IkT63I+gRcGNBJxmEWJDmfS
	 3oZGHvcWMj3TgjrdrYa0l0TI3sISaA3Cf5/pT/RA5ZsNdGxa1wh1TprkgEdw/cobrlKgt
	 Z6vavhpRyqCVGXnFqm3RnEMcfg+NSzrW1zUyUFsD61kSHk9rYashI16XBIKjw6nDaPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795310114;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:
	 References:Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=v7lEg495LrCIbxZuP8ufMwGsxVJReYwI/MOkO14mWSk=;
	b=g1Fk/EEbImYd9my5KUaA85nfgclQWyYEsU+1if9zrzJu3o973sWlxLD25XaiIuaUrEGo
	 vHCSE8mp4AI9YQg0K98Gx+nP4HsIy5gspuGJ4sGKvjqMMak1VKpkGb6yCze3cS3WfvCDq
	 xOf6cyzaB6JVOVsWJjDexOlUcehDnn3oFLOjJpvxKTiYl/pnia0R0MWyiqZzovtzE9Ti6
	 4i7l7BBqzb7ALJ5rZmS6iRC7IaBoDHgB2qJuulkJCbW5nfhnSvUlieyBd/tObB7R/SEa0
	 OIfunv70uw205ZC2dpSuEnOD+2dpLeHD7Mlch115iVUjofXLrj0kEmM2nS087OsjYRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=u2eycPX7;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC80606A332
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Nov 2026 01:15:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEC80606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=u2eycPX7
Received: from eig-obgw-5007b.ext.cloudfilter.net ([10.0.29.167])
	by cmsmtp with ESMTPS
	id UViGxJzowAR1iUwAjxOs3V; Sun, 22 Nov 2026 01:15:13 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id UwAixHNg3xqjjUwAixkMg8; Sun, 22 Nov 2026 01:15:13 +0000
X-Authority-Analysis: v=2.4 cv=bZxrUPPB c=1 sm=1 tr=0 ts=6b024221
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10
 a=bZ9ZFHcraDQnooAIPG0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=v7lEg495LrCIbxZuP8ufMwGsxVJReYwI/MOkO14mWSk=; b=u2eycPX7zn6A
	/CUDf57E57hxXV3mdnD53watV3Zp3TtChPOdD5E+EbMi5clifMjupkhsCzUxMKFf8fJfs+RKdHwQD
	nlYQ9/I9b9PK70YMkbYQpOtX6fexMguUNMRRkvOOJLd/XgKqHg+ODt37FOwyR0vBRC1217IbBdvFO
	oChTo9KR6IyO2M9SKO0L47TWzYLu8D9rvOYqcnN761M+Ooh5pwxrEyyQ1g07Xz3u+ZG+iPZxfgh/+
	MS4uMPyod12nhF4Ih7dwS/AbtX1taLWUxyBw1quRIZGSqHte84E/3pVV2oYbYX8egwIHhv0lhQ9On
	FRmM2MAVqS34TCTO5X0ryA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:49696)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xUwAi-00000000h5z-1bs3;
	Sun, 22 Nov 2026 06:45:12 +0530
Message-ID: <418b6aaa-e7ba-4e26-9d64-309ff27ac478@roeck-us.net>
Date: Sat, 21 Nov 2026 17:15:11 -0800
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
Subject: Re: hwmon: (aquacomputer_d5next) Aquaero 5 no longer probes after
 b7743c6dbe3a
From: Guenter Roeck <linux@roeck-us.net>
To: Spoon3er <spoon3r73@googlemail.com>, linux-hwmon@vger.kernel.org
Cc: Aleksa Savic <savicaleksa83@gmail.com>
References: <3b6ce200-ae89-4629-a05b-bcdc503871d3@gmail.com>
 <ac6df30d-f893-4eb8-984a-ecd072167c0c@roeck-us.net>
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <ac6df30d-f893-4eb8-984a-ecd072167c0c@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xUwAi-00000000h5z-1bs3
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:49696
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 3
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfA+h7bzsRHoN4OEk5ga7rEm8tRag7XNVKnik0oOrVQogkF6PfeDjGFSnPiVl8LcGI7mmbVMp58wI1GsxhReHkxLpxXBaqLgilo8c5voKiE1/70ZN9HYG
 55PhOCQUEXmEXm1+YcV0euWq+Ab3JJU7CfBQctfepy+FH6nS8lQ144Sam7xZBUtyojmyv/axTh5SA30abhA+wRHftSh4ohZkIaqscIS/ogafCC453GvmHp3Z

On 11/21/26 15:40, Guenter Roeck wrote:
> On 11/21/26 14:35, Spoon3er wrote:
>> commit b7743c6dbe3a ("hwmon: (aquacomputer_d5next) Check maxcollection when
>> probing AQUAERO devices") breaks Aquaero support here: aqc_probe() returns
>> -ENODEV, no hwmon device is registered, and the HID interface is left without
>> a driver.
>>
>> Hardware: Aquacomputer Aquaero 5, USB 0c70:f001, bcdDevice 0.02.
>> Kernels: 7.3.5-2-cachyos (carries the patch).
>>
>> Aquaero exposes three HID interfaces under the same VID/PID. Values observed
>> in aqc_probe() after hid_parse():
>>
>>    keyboard/mouse        3             0x00010006               1
>>    System Control           2             0x000c0001 1
>>    aquaero Device           1             0xff000001          (not parsed)
>>
>> The "aquaero Device" interface - the one the driver has to bind to - only
>> presents a single vendor-defined top-level collection. The new
>> "hdev->maxcollection < 2" test therefore rejects it before the
>> collection[1].type check is reached. kretprobe on aqc_probe() confirms the
>> return value is -ENODEV.
>>
>> Before the commit the check was only "hdev->collection[1].type != 0", which
>> happened to work: the collection array is allocated with collection_size ==
>> 16 and zero-filled, so collection[1].type reads as 0 for the device.
>>
>> Proposed fix - bounds-guard the read instead of requiring a second collection:
>>
>> --- a/drivers/hwmon/aquacomputer_d5next.c
>> +++ b/drivers/hwmon/aquacomputer_d5next.c
>> @@ -2983,7 +2983,7 @@ static int aqc_probe(struct hid_device *hdev, const struct hid_device_id *id)
>>            * their respective collections set to 1, while the real device has it set to 0.
>>            */
>> -        if (hdev->maxcollection < 2 || hdev->collection[1].type != 0) {
>> +        if (hdev->maxcollection > 1 && hdev->collection[1].type != 0) {
>>               ret = -ENODEV;
>>               goto fail_and_close;
>>           }
>>
> 
> Makes sense.
> 
>> I verified it on 7.3.5 and 6.18.64: the driver binds, hwmon "aquaero"
>> appears and flow/fan/temperature readings are correct.
>>
>> Happy to test a formal patch if you prefer.
>>
> If anything, I'd prefer if you would send a formal patch.
> Oh, never mind, I guess if you wanted to do that you would already have done
it. I'll send a patch shortly.

Guenter

