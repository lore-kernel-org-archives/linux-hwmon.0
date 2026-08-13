Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83325473C7D;
	Thu, 13 Aug 2026 12:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786622434; cv=none; b=La67puiX4Xg6bG9QlftcEjMIAXzkLdUJ6EpQbDCpXJiPh/nanqKdPx2LdIUGZ67z7B2nxFhMMw1d/4qQlh/eC7QQ+CG7dFAooFyH33wXVnNX8A+hmukUKCk8qxroiCTShN8a/2+J+goEwvL+fJQjBIW5SaLjvbWJtc5U42MGJw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786622434; c=relaxed/simple;
	bh=jFqFnXmun73lqBi38J4Ohjj6dbepdoUFqbnaPWtPFR8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TX6eVL+FNy63CGtYgK9ZkLzGUBYbDBsJ1Gqy+M7YVzANMdPPE0YU5HZ2qrnMHGVcDMQvw+ugtZ6OkwRVRKt8GDfRX9dZJvgtq50bDu9n9688xj+KufAM7XovC2khTn7W36tHEByZuzAMTLrf8jspFdiCztsf51onapBRpgxwglw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=byb41/NT; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="byb41/NT"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B670711AB4F;
	Thu, 13 Aug 2026 14:00:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1786622421;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=XvWwJX9flOq3VFympf+3qKEbCXnh6A5Ccfp8NS+7XkA=;
	b=byb41/NTwp96eCzQjgGM9p/sTlwAxoaL6J2aqYPQKWmZDHezkMWKiWwZf7FucG2qA53/fZ
	n+X2eNANETykGySPbN6GUaIVb7WaDdld8ZfRdbk4rPBe2ObhOSAP4GnIUx84DnJF7MDFMm
	L9BiadgwV0gxIewpdFNmE0S/dre/zKajZg/bk8Pr7D5CVARqFDSaTxlc3cUDjsV14p/ep0
	gTezfZOAb+WFnQ8w06FrI9c3UYspsnWIpeaN5nTTWDK+HcFif31h6/eYPG543DYCXl4hb5
	0A9Lg3RAkV5pRxfIU6KpCzMBwgPz68Sv9dWspD1i1mDD4GpRQhR5zwkqZ0Infg==
Message-ID: <e586dbc3-91d4-4247-b7bd-81699b965cd3@nabladev.com>
Date: Thu, 13 Aug 2026 14:00:19 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: (tmp102) Add TMP113 device ID
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Flaviu Nistor <flaviu.nistor@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260813090456.70816-1-marex@nabladev.com>
 <20260813090456.70816-2-marex@nabladev.com>
 <1cf0f701-e52d-4adf-91c9-e6b1a8753acc@roeck-us.net>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <1cf0f701-e52d-4adf-91c9-e6b1a8753acc@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 8/13/26 1:51 PM, Guenter Roeck wrote:
> On Thu, Aug 13, 2026 at 11:04:24AM +0200, Marek Vasut wrote:
>> The TMP113 temperature sensor part is register compatible with TMP102,
>> add non-DT I2C device ID. Unlike TMP102 and TMP110, the TMP113 does
>> have additional unique ID registers, those are currently unused.
>>
>> Signed-off-by: Marek Vasut <marex@nabladev.com>
> 
> Applied.
Thank you. I think this solves the TMP110 and TMP113 documentation 
concerns too.
