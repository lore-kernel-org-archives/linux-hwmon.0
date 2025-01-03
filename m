Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A67A1CCB26
	for <linux-hwmon@vger.kernel.org>; Fri,  3 Jan 2025 09:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735895814; cv=none; b=JYkwgoG3k1ccUc0Vb8B7SRB06XTQ//ur73O5RgSdNCTful8Afveh38kPKuxFwC1SgkGFbGnvb9cfBGnTmeztIpTPQV1tG2yNWFcK/hQypv1H1qa2MRVf3fBFv5JIzSb3hv2672qNULcm+k5CInMF6TG01559MqUC07TfOr25ybw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735895814; c=relaxed/simple;
	bh=jll8r/u8sZ/0KgiwoGlKUd4V48/B4MTHO9pEurOPBRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kGkpNZvU/HfG/Tu8Dk1fw8VYL4GvMUfJjLKDII6+7eCqBVk4udFIFzzew4fh8we81mwyXZFE3caUoSHEx2/FfTubxvzLMqt7G3muxBhLCD9Xd6tLk2cUHaS9tWVv03Ol8jNAIXEjcd4a+ylkn4EOeEThSaUvy6OnrxqDA3+hNkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=otvM7b/F; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="otvM7b/F"
DKIM-Signature: a=rsa-sha256; b=otvM7b/FO27Uw8b8YuK6SYC8HpswuhXYzM/QonTvKDeWRcyVUHHlI9tdOxCWwTftS+KOnMqkVDACF8HI0+9LQQCQ7qJ6BS/w0sDI3DgDs2M7IKA54penmdaypz9ru42HY4t1y5lzyzuWuRuK6kU2cYnjv8PKviJ+qRH9QHlwfd+OHJzEvefNK4Prw8gogmmogZH7bPmyC3zqrItEwWCzv2cEPmcJgPKFyHU47MNXvn71nOovM7dhAnY33vzxcp8tOKhNmfunIJdUweXx+ZJW9D6M2DTv39h8HW2k/f1sTz/EU4eesIRM2SFkurr6zsHW5bcO1azAAUsw9exc8OrFgg==; s=purelymail3; d=purelymail.com; v=1; bh=jll8r/u8sZ/0KgiwoGlKUd4V48/B4MTHO9pEurOPBRM=; h=Feedback-ID:Received:Date:Subject:To:From;
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: linux-hwmon@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -2144673025;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Fri, 03 Jan 2025 09:16:26 +0000 (UTC)
Message-ID: <c14e5b92-5952-4c7f-a64c-38e579278fa2@korsgaard.com>
Date: Fri, 3 Jan 2025 10:16:23 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pwm-fan: Document default-pwm
 property
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 linux-kernel@vger.kernel.org
References: <20250102175041.822977-1-peter@korsgaard.com>
 <173584586623.427850.4042944653628496064.robh@kernel.org>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <173584586623.427850.4042944653628496064.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/2/25 20:24, Rob Herring (Arm) wrote:
> 
> On Thu, 02 Jan 2025 18:50:40 +0100, Peter Korsgaard wrote:
>> The pwm-fan driver uses full PWM (255) duty cycle at startup, which may not
>> always be desirable because of noise or power consumption peaks, so add an
>> optional "default-pwm" property that can be used to specify a custom default
>> PWM duty cycle.
>>
>> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>> ---
>>   Documentation/devicetree/bindings/hwmon/pwm-fan.yaml | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml: default-pwm: missing type definition
> Error: Documentation/devicetree/bindings/hwmon/pwm-fan.example.dts:75.25-27 syntax error
> FATAL ERROR: Unable to parse input tree
> make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/hwmon/pwm-fan.example.dtb] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1506: dt_binding_check] Error 2
> make: *** [Makefile:251: __sub-make] Error 2

Ups, I added the entry to the example AFTER running make 
dt_binding_check and missed the <>, will fix.

-- 
Bye, Peter Korsgaard
