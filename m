Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D634E77102;
	Thu,  9 Jan 2025 21:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736456632; cv=pass; b=o3r2b8IsNrXv+p2jywki4oV870q8lAGvbCoP7F9hdrs+D0PPbBc5KmOC9YoBgolHvv+JIs4BZkndjEIVUw2dSzE+tDIxjksG6fywuh1Q7AVrzUCRwTHofY0ppPNqzPvo97B4NMUoX9VP6JBQSfDvErxMRkZBrAbyKe5yv3uvpbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736456632; c=relaxed/simple;
	bh=nzVVBILEHct4ni7Z5Mjhf41EGQ25l/BVM3DkuYDGFDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SUJrUoa+hpwW5IY+LfFtJ3oZ0GPC/DsuPSp176MODJVWq5bd1phUNltR5p/cNCEfiYWQEBHYPnau/HgLAvcT7I/YCd712Hpg0G11zhaJzwChoGwGUIdbZzRznepaCo2LGp5zvb6CReScaAuVxEjKkKKyZTJ9m6zt5SL2LNqRsfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radix.lt; spf=pass smtp.mailfrom=radix.lt; dkim=pass (1024-bit key) header.d=radix.lt header.i=povilas@radix.lt header.b=UqQxa4VM; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radix.lt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radix.lt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=radix.lt header.i=povilas@radix.lt header.b="UqQxa4VM"
ARC-Seal: i=1; a=rsa-sha256; t=1736456608; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WFp0xwTZyFMXqmkMWo+WsJohNNmFksg/WqfBEQADbfyyL+ugO6wzCy0B4ynyb+ct1Wo2em6sM8GPqpWvcTfR/AKW3viXBIVhjSYxf44wTm6H4pVCw8ic/I0hxlrqY4KESNeSsuNrNvRLTMRjxfkbsxVQnQ+nwpWvDKuXCGdj52A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736456608; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Yqs+WnceiDizOWDVK2TbFZPWN6t7qQQosy7ctztvM+s=; 
	b=NUQzoo0SH+F+eYALRbX9Xvfowy0vM69AhqBOv/Xv/VOeBFklpfNWETVuaY3tuxkhpKaZZ+XngwK5B7ehmhUdvaZPZm072DqIMNwFgMj2tokImrcIECrrvdKKmdSVYGDBfpu2WUsaVCyUIDWE2x6V8Sfrx1O+sNCQa2JaBs6KktQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=radix.lt;
	spf=pass  smtp.mailfrom=povilas@radix.lt;
	dmarc=pass header.from=<povilas@radix.lt>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736456608;
	s=zoho; d=radix.lt; i=povilas@radix.lt;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Yqs+WnceiDizOWDVK2TbFZPWN6t7qQQosy7ctztvM+s=;
	b=UqQxa4VMjZXbyTh+x5bKiaWJoqHoD+ppxfVrERMkc84oD/aWuYrGG03J66rmbQDf
	NeFTefD8qgEgnSunfugbMWGwNduVxmRYeaTb9St7dvubrVybBG9pr3D1RHDThe72SyO
	xx4yzXpppb3cqBXGdaSPWGMKpHCRaN71USi6yacA=
Received: by mx.zohomail.com with SMTPS id 1736456606581159.55154383820013;
	Thu, 9 Jan 2025 13:03:26 -0800 (PST)
Message-ID: <0562de57-1d45-4b82-bb0e-e98ee1d6221b@radix.lt>
Date: Thu, 9 Jan 2025 23:03:23 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (dell-smm) Add Dell XPS 9370 to fan control
 whitelist
To: Armin Wolf <W_Armin@gmx.de>, pali@kernel.org
Cc: jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <e5d65c8a-4785-4635-ad77-d5155f517155@radix.lt>
 <fa78f27a-a92c-452d-b710-c4b3c8c52629@gmx.de>
From: Povilas Kanapickas <povilas@radix.lt>
Content-Language: en-US
In-Reply-To: <fa78f27a-a92c-452d-b710-c4b3c8c52629@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 2024-12-07 23:26, Armin Wolf wrote:
> Am 07.12.24 um 21:26 schrieb Povilas Kanapickas:
> 
>> Add the Dell XPS 9370 to the fan control whitelist to allow
>> for manual fan control.
> 
> Can you check if using i8k_fan_control_data[I8K_FAN_30A3_31A3] also works?
> 
> The reason for this is that the official Dell software seems to use
> those SMM calls
> to enable/disable automatic fan control. If this does not work then you
> can keep
> the i8k_fan_control_data[I8K_FAN_34A3_35A3].

Sorry for taking this long to test. I can confirm I8K_FAN_30A3_31A3
works. I will submit a new patch.

Thanks,
Povilas

> Thanks,
> Armin Wolf
> 
>> Signed-off-by: Povilas Kanapickas <povilas@radix.lt>
>> ---
>>   drivers/hwmon/dell-smm-hwmon.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-
>> hwmon.c
>> index f5bdf842040e..bcb295ea3319 100644
>> --- a/drivers/hwmon/dell-smm-hwmon.c
>> +++ b/drivers/hwmon/dell-smm-hwmon.c
>> @@ -1544,6 +1544,14 @@ static const struct dmi_system_id
>> i8k_whitelist_fan_control[] __initconst = {
>>                  },
>>                  .driver_data = (void
>> *)&i8k_fan_control_data[I8K_FAN_34A3_35A3],
>>          },
>> +       {
>> +               .ident = "Dell XPS 13 9370",
>> +               .matches = {
>> +                       DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>> +                       DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "XPS 13 9370"),
>> +               },
>> +               .driver_data = (void
>> *)&i8k_fan_control_data[I8K_FAN_34A3_35A3],
>> +       },
>>          {
>>                  .ident = "Dell Optiplex 7000",
>>                  .matches = {

