Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEAF37F8B1;
	Tue,  1 Sep 2026 19:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788291223; cv=none; b=mU/NKzzhPcQPmEo7Q0G6PQXx4eKys7Ykpxkz9diYK5MTDtNKDqnFIOlxFNtL+q0GKzrVj0pFOlBkcSzLwOd0vHRh5EW6CFLnSPKLd45P2q7RLtYPk/DR6p+xqireXSvh/T0Yrwgapnd0emuAEywHawv4aiHU7OjstaG4Demxj6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788291223; c=relaxed/simple;
	bh=3szOmUGcEoeQFBPwmyxxSnYGPnMskQkLS5H8JBt4M7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UTlXDUg54EkIiMtuuG9UO64902CBJLLrDXAN2JX/BD6JFodMblW/fKzCTD5DxLfee+W+UThU7L0vpWozExJjxjEWmtMMQObUtcPaTDS+6mEnAqstsBhGIyzEY+qTTYtzZZe4yKGi3lW9Gi9dkM8hIILmyAv4/b2s/HwF9/lzNkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=mIdqZL0S; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="mIdqZL0S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1788291219; x=1788896019; i=w_armin@gmx.de;
	bh=3szOmUGcEoeQFBPwmyxxSnYGPnMskQkLS5H8JBt4M7Y=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=mIdqZL0S3+70K5yuf4zpfYyfG08DYXufLrLBwX3FackLyKfdA0FIh5u6sD7LaLB2
	 dgWkmfan5ObE36KHo2PuIO16RJRNvaK34P20lv5DzxTZdfWXvbHmQT3ynFTondhIE
	 zheQn8OqF3WlVJQuulmOv+NTJKsoXlG15VLUhKBJCnqDcTBc8K/woHFPQxyiqj0Fr
	 keThT89o5IA/g09OPg6Mig01oreEDzvz7z0FTHb26tTqbTFzTDRkFqRTGTqY7xK4Y
	 KG5XxomDgXHpVMLZzqYb7C24xls1lFoh3mPzYWsZUcqjETaLwPMLKkcm+RgIlyRQA
	 ZFQw+ah70z2siusBbw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MmDEm-1wbBuU47JA-00qXv8; Tue, 01
 Sep 2026 21:33:39 +0200
Message-ID: <db7e602d-0abc-404d-93cd-5ee594039bdb@gmx.de>
Date: Tue, 1 Sep 2026 21:33:38 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: (dell-smm) Add Latitude 5420 to fan control
 whitelist
To: Guenter Roeck <linux@roeck-us.net>
Cc: pali@kernel.org, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, pp12313124124@gmail.com
References: <20260901181849.241776-1-W_Armin@gmx.de>
 <20260901181849.241776-2-W_Armin@gmx.de>
 <3a6a3bdc-713b-40e3-8865-671d52af1fda@roeck-us.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <3a6a3bdc-713b-40e3-8865-671d52af1fda@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:K/ON4vSOUKOXfpdqWVOrWHNc+O28908bveSl0tszkRBLdyzSbp/
 AZJC1U0KI7p4D2GlESG92HfJClIczu3qSwrJ7YgwFOy0347eoK6wiUy33zc9o2hNOAZ+kC9
 CdPONI0pTpfGGfNMjK96Rqr20+4v3z9w+WjbZHwtN9A33oHfNbLd2+05xA6DSiPOBCFPjcH
 ViQ29H2bpdMSkeLqSmJeA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:w9xxjLDg6Ks=;ptQjb48nrFu4Cg7tqK7/8xPqJdq
 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
 o4r0OccsZyDZ/XfIHu89H8xku53HMP57

Am 01.09.26 um 20:24 schrieb Guenter Roeck:

> On Tue, Sep 01, 2026 at 08:18:49PM +0200, Armin Wolf wrote:
>> A user reported that the Dell Latitude 5420 needs to be whitelisted
>> for the special SMM calls necessary for globally enabling/disabling
>> BIOS fan control.
>>
>> Reported-by: pp12313124124@gmail.com
>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221935
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> Applied.
>
> Thanks,
> Guenter

Thank you :)

