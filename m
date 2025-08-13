Received: from mx4.wp.pl (mx4.wp.pl [212.77.101.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B35212569
	for <linux-hwmon@vger.kernel.org>; Wed, 13 Aug 2025 09:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755078784; cv=none; b=GlPzUj3+4J0rB21UhWDHmdDZfDGsAMdlitF4gAezyac5cmMdkaw2z3h2PBDfzVZL5pFiwYM9EjYNdxyVRNosHCuRtwaSeQirpLFkMn8dZCn4UuxB6D2dr2ue9FSHNV1TNavbdMDDRCsVBdBG6doHaWCHZqp1VhXfjK0A4X1xsS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755078784; c=relaxed/simple;
	bh=Rrg+PDeB1og0Ip97n8NMinUcp87go5qnz3BHKDTd/nU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=V15gTzFKonba6XwhNRXqAjsv1yuo4jeLpaGsA+9uuJdd3T/gNYM5wcbLbYtFCT/QggFWYq/a+sYjeMDynBD4n+F3yIK1YCg+FGZuRx6L5Md0nNg8vl8JtF+wW2xLQH+6sEwt3fwZjUauoynVQpWyREuaty5EuXM1YALrkJAwveE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=sVMeAFx6; arc=none smtp.client-ip=212.77.101.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="sVMeAFx6"
Received: (wp-smtpd smtp.wp.pl 46995 invoked from network); 13 Aug 2025 11:52:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1755078775; bh=AAtYHcTaVyCFpkLjxJA7aO2dq1kno3BoVNBG/qhbPvs=;
          h=Subject:To:From;
          b=sVMeAFx69/OgX7TxKXwY6qEp4Goae5lJ90CJwEgIeTOmKh9jX7b4TSqOvejsNA6Pd
           s+6eSR7O3ILRI3aPpm9WFA5DQtE1+POJv86OfV8JJE7L/VAeQWfJq2djfvBHu3jBEW
           RpHuhDGI7XKItT+PjT+HWEB3eQHbxX6WGO5YWWE66dGkdb18qB3g7Wi2wGazUdrOzS
           4tNoILnmwiH4Heo6JQrS8rg/p3QCoJOXUlx8R4DJuEJLDU8wpsfP/9u9HWcaLcpEC1
           V7sGUkjfysKxEizSgYuyXvmkE3/UKWcdoxGKqe/5MTfpqFXjeo2cSSiVjA0wrj4Zby
           nqrJ1v33qbauw==
Received: from 83.24.134.210.ipv4.supernova.orange.pl (HELO [192.168.3.229]) (olek2@wp.pl@[83.24.134.210])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <krzk@kernel.org>; 13 Aug 2025 11:52:55 +0200
Message-ID: <9d0ebfe1-e92b-45e0-baf1-3d6d2ce4c568@wp.pl>
Date: Wed, 13 Aug 2025 11:52:54 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: hwmon: convert lantiq-cputemp to yaml
To: Krzysztof Kozlowski <krzk@kernel.org>, jdelvare@suse.com,
 linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, fe@dev.tdt.de, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250813091924.1075488-1-olek2@wp.pl>
 <6f46e420-832a-4c6e-b1e9-d797b0425834@kernel.org>
Content-Language: en-US
From: Aleksander Jan Bajkowski <olek2@wp.pl>
In-Reply-To: <6f46e420-832a-4c6e-b1e9-d797b0425834@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-WP-MailID: 46fb8cb658e1bebe764a3937a8873c36
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [QfNi]                               

Hi Krzysztof,

On 8/13/25 11:24, Krzysztof Kozlowski wrote:
> On 13/08/2025 11:19, Aleksander Jan Bajkowski wrote:
>> +---
>> +$id: http://devicetree.org/schemas/hwmon/lantiq,cputemp.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Lantiq cpu temperature sensor
>> +
>> +maintainers:
>> +  - Florian Eckert <fe@dev.tdt.de>
>> +
>> +properties:
>> +  compatible:
>> +    const: lantiq,cputemp
>> +
>> +required:
>> +  - compatible
>> +
> I think this reads and writs to some IOMEM space, so you really need
> here 'reg'. That's the problem with such old bindings... binding is
> broken, DTS is half-baked or non-existing, driver has 20 years.


These devices are not so old. They support multithreading. In the case
of NAT, they can process up to 700Mbps of traffic.


>
> BTW, why converting this old binding? Do you have any interest in
> actually running MIPS?


I have several devices with Lantiq SoC (xRX100, xRX200 and xRX330).
They are supported by OpenWRT. These are the only devices with mainline
Linux that support ADSL2+ and VDSL2. I would like to add the missing dts
files for the xRX200 and xRX330 families. I have started fixing the errors
reported by the dtbs_check script.

Downstream dts:
https://github.com/openwrt/openwrt/blob/main/target/linux/lantiq/files/arch/mips/boot/dts/lantiq/vr9.dtsi#L29

>
> I assume you did not check Rob's dt-convert branch to avoid
> duplicated... because he did convert EXACTLY this binding. And more from
> Lantiq.


Thanks, I didn't know that.

>
>
>
> Best regards,
> Krzysztof
