Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200C43F7E70
	for <linux-hwmon@vger.kernel.org>; Tue, 24 Mar 2026 12:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774357174; cv=none; b=ZKQ3CFaWfloJVmyxQCAPcuw+ppx9y9Exh02FVZ6hTsXDKrb7mRKgWs1stJrtQZLk0sM9dDk2pItSsBl7/nIYCQjE/9KnaZLP4u7N59eZTWcfXuqPFj4OjxM36glaW8j0wnHofwzzVUFhQZiMHwywJZB4pIaxoRW9DsXZWJvliik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774357174; c=relaxed/simple;
	bh=A9WppwW+5nYf74kSqIWyRbdH9mgFqE48/dceyoU2WEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cOiZwT05wc550q4Bb2jfpOYwixEyO8sH5fkPyV2CFFWB5TIN3fut8owR9+ubRlpd1FW7yMCs8L47oVWdvoKXEEssIv+nAn2G6Nmn1g+WBP/tQyqcwBfB/ovMWH7pGDQ2a6GTUGj9G6ZinTPsFt6t46qeZMWYBLO/k3UJLmAqzX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bF93PGbK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bF93PGbK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774357172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=66aXgAm8lrLIlJwDHDhuJeRhflv8crX+JxuXz8zsArI=;
	b=bF93PGbKF8ZQ8tOOfNJ2jfXrIZyep70q+PRDlSOOuHlrDP3LarfYlAV0uf/iqBODhMA20E
	H4tkz1hziJnAZntPajbFvDRcayOH2KLVqTD3TNnqpoSCYqVCN8VKrXmlyUa4x5OKEE0cRf
	3usDP1pnIViwJklyuffeWOp6mqbQk0s=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-6-qVQpQO9YOSi99nlh1Us6Fg-1; Tue,
 24 Mar 2026 08:59:25 -0400
X-MC-Unique: qVQpQO9YOSi99nlh1Us6Fg-1
X-Mimecast-MFC-AGG-ID: qVQpQO9YOSi99nlh1Us6Fg_1774357164
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AAA6A1956096;
	Tue, 24 Mar 2026 12:59:23 +0000 (UTC)
Received: from [10.43.2.199] (unknown [10.43.2.199])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4B9B419560AB;
	Tue, 24 Mar 2026 12:59:20 +0000 (UTC)
Message-ID: <8486ce6e-ad2a-493d-b734-b40e8db9213e@redhat.com>
Date: Tue, 24 Mar 2026 13:59:19 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/3] dpll: zl3073x: add hwmon support for input
 reference frequencies
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>,
 Prathosh Satish <Prathosh.Satish@microchip.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, Michal Schmidt <mschmidt@redhat.com>,
 Petr Oros <poros@redhat.com>, Simon Horman <horms@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Jakub Kicinski <kuba@kernel.org>
References: <20260320105915.149068-1-ivecera@redhat.com>
 <20260320105915.149068-4-ivecera@redhat.com>
 <964752ec-8e6d-444a-aad0-80da3acb2dab@roeck-us.net>
 <7dbb5130-72cf-49d2-bfac-3439deb1b2e3@redhat.com>
 <20260323154825.1a2320c4@kernel.org>
 <50a1671c-9901-426a-97ed-bf36400fe9a7@roeck-us.net>
 <6f1e98b3-4b86-4b7f-8c91-d8d5721aeb25@redhat.com>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <6f1e98b3-4b86-4b7f-8c91-d8d5721aeb25@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Hi Paolo,

On 3/24/26 11:49 AM, Paolo Abeni wrote:
> On 3/24/26 6:16 AM, Guenter Roeck wrote:
>> On 3/23/26 15:48, Jakub Kicinski wrote:
>>> On Fri, 20 Mar 2026 14:48:01 +0100 Ivan Vecera wrote:
>>>> On 3/20/26 1:21 PM, Guenter Roeck wrote:
>>>>> On 3/20/26 03:59, Ivan Vecera wrote:
>>>>>> Expose measured input reference frequencies via the hwmon interface
>>>>>> using custom sysfs attributes (freqN_input and freqN_label) since
>>>>>> hwmon has no native frequency sensor type. The frequency values are
>>>>>> read from the cached measurements updated by the periodic work thread.
>>>>>>
>>>>>> Cache the device ready state in struct zl3073x_dev so that
>>>>>> freq_input_show() can return -ENODATA without an I2C access when
>>>>>> the device firmware is not configured.
>>>>>>
>>>>>> Signed-off-by: Ivan Vecera <ivecera@redhat.com>
>>>>>
>>>>> "frequency" is not a hardware monitoring attribute. I understand that it is
>>>>> convenient to report it as one, and that other drivers implement it as
>>>>> well,
>>>>> but that doesn't change that.
>>>>>
>>>>> I understand that the code lives outside the hardware monitoring
>>>>> subsystem and is
>>>>> thus not in control of its maintainers, so you can essentially do
>>>>> whatever you want,
>>>>> even if it is wrong. That doesn't change the fact that it is wrong.
>>>>>
>>>>> However, do _not_ try to add it into the official list of hardware
>>>>> monitoring
>>>>> attributes. I would NACK that.
>>>>
>>>> Understood. I recognize that frequency falls outside the strict scope of
>>>> hardware monitoring and does not belong in the official hwmon ABI.
>>>>
>>>> I'm using it here as a convenient way to expose these specific driver
>>>> metrics, but I hear you loud and clear. I will absolutely not propose
>>>> adding frequency to the official list of hwmon attributes or
>>>> documentation.
>>>>
>>>> Thank you for your time and for reviewing the patch.
>>>
>>> Guenter, should this be a debugfs interface, then?
>>>
>>
>> There is nothing that prevents the actual (generated ?) frequency to
>> be reported as sysfs attribute attached to the chip (spi) driver, if
>> it is indeed of interest. If it is of interest for all dpll drivers,
>> it could be attached to the dpll device, the chip driver could make it
>> available via dpll_device_ops to the dpll subsystem, and the dpll
>> subsystem could provide a common API function (such as the existing
>> temp_get) and generate a common set of sysfs attributes for all dpll
>> devices.
>>
>>> Also an hwmon noob question - isn't it better for the monitoring
>>> interface to report frequency error / instability in this case
>>> instead of absolute value? Or do you not know the expected freq?
>>>
>> In the hardware monitoring world one would have min/max attributes and
>> one or more alarm attributes. I never heard about the idea of reporting
>> deviations, and for typical hardware monitoring attributes it does not
>> really make sense. What would be a "deviation" of a temperature/
>> voltage/current/power/humidity sensor ? Such attributes typically have
>> an operational range, and they are allowed and even expected to
>> fluctuate within that range.
> 
> Ivan, my take on all the above is that using the HWmon interface here is
> stretching it too much. I think it would be better to move debugfs
> and/or netlink events.

I'd rather avoid debugfs... My proposal is to expose absolute measured
frequency attribute of dpll-pin and follow phase-offset-monitor
functionality:

So:
* add real-frequency attribute to dpll pin
* add real-frequency-monitor attribute dpll device
* user will be able to enable/disable monitoring by enabling/disabling
   real-frequency-monitor feature (similarly to phase-offset-monitor)

Thoughts?

Thanks,
Ivan

