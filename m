Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D841D191F8E
	for <linux-hwmon@vger.kernel.org>; Fri,  8 Nov 2024 16:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731082443; cv=none; b=Cw6wDSiIjcYUcdOC8s4Se5tjUh2706CNSSo6wd//xShg1VT+SGaBdPWd6YiBXWOlpfDA7cT9fsK/XpsndmrKLDeEHfPqp1zClO7qbRWu325DoDm//WSHmtsBYPi09LYickMn3r21r4co5MtnKF5cZ0NOHeZMQD8nDQi4LAyp3Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731082443; c=relaxed/simple;
	bh=L2fvUnNpiImIwbOsAFvJPfgvUhn/j9AgyjnrX0YXBQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VrPm/cFeCaRv9YUaW5LpBtE5uCYvBrOsl8Xz3AsItJ1CF5oD5E67nCk57a3WIAJFLsjoh6FOD9ahyV4rV0eVJNYmGTHa1xcLFieiT6V7kh6xAvm4mxrW3RCDTi4exwajbqwEfAMtBOXhkvX2WTEXzQQ/HmZB7f3N4iZW+hCjPOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=rC6mKHcg; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="rC6mKHcg"
Received: from [192.168.42.96] (p5de457db.dip0.t-ipconnect.de [93.228.87.219])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id C18F92FC0061;
	Fri,  8 Nov 2024 17:13:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1731082436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qx6fpSQd7Y//GfnzaBfTLsQxuKqe5onDij814QCOXx0=;
	b=rC6mKHcgEWqRtk3F+O1eqYQAg4Djj0s2dRn4WBESBV6JfapVL18o4sVFxlUXIR3572G59Q
	2qAJDCgGAhmH2KMe/E2vTOMqenu37wXdTsRPVOWFZRKyQqOO73BsyJaFB+ecmRp2k27CUa
	WLc5ncnruE0nkmJwgcA7LANLFz05LkA=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <a73488bf-fd53-4894-a47f-8d76148b5e10@tuxedocomputers.com>
Date: Fri, 8 Nov 2024 17:13:56 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: CPU/GPU fan control with safety via hwmon
To: Guenter Roeck <linux@roeck-us.net>, Hans de Goede <hdegoede@redhat.com>,
 linux-hwmon@vger.kernel.org
Cc: Armin Wolf <W_Armin@gmx.de>, Juno Computers USA <usa@junocomputers.com>
References: <172b7acd-4313-4924-bcbc-41b73b39ada0@tuxedocomputers.com>
 <f26d867e-f247-43bb-a78b-be0bce35c973@roeck-us.net>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <f26d867e-f247-43bb-a78b-be0bce35c973@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Am 08.11.24 um 15:30 schrieb Guenter Roeck:
> On 11/8/24 04:05, Werner Sembach wrote:
>> Hi everyone,
>>
>> I'm currently conceptualizing an upstream implementation for the fan control 
>> on our Sirius 16 Gen 1 & 2 devices which has the following custom WMI 
>> functions (pseudo code):
>>
>> void SMOD(bool mode): Toggle firmware controlled fans vs manually (aka via 
>> the commands below) controlled fans
>> bool GMOD(): Get current SMOD setting
>> int GCNT(): Get number of fans
>> enum GTYP(int index): Returns "CPU-fan" or "GPU-fan"
>> void SSPD(int index, int value): Set fan speed target as a fraction of max speed
>> int GSPD(int index): Get current fan speed target as a fraction of max speed
>> int GRPM(int index): Get current actual fan speed in revolutions per minute
>> int GTMP(int index): Get temperature of thing fan with respective index is 
>> pointed at (CPU or GPU die, see GTYP)
>>
>> However there are some physical limitations that are not in the firmware and 
>> I would like to implement as low as possible in software, aka the driver, to 
>> avoid hardware damage:
>>
>> 1. Valid fan speeds are 0% (fan off) and 25-100%. Values from 1%-24% must not 
>> be written.
>>
>> 2. As long as GTMP is > 80°C fan speed must be at least 30%.
>>
>> We would love to see the same driver enforced restrictions in the Uniwil 
>> driver Armin is working on and the Clevo driver Juno Computers is working on.
>>
>> My Idea so far:
>>
>> 1. Round SSPD input: 0-12% -> 0%, 13-25% -> 25%
>>
>
> That is acceptable.
>
>> 2. Periodically check GTMP (every second should be enough) in driver and if 
>> the temperature is over 80°C set current and incoming speed commands to at at 
>> least 30%.
>>
>> Is this legitimate with the hwmon design?
>>
>
> No. That would have to utilize the thermal subsystem. hwmon is not intended to
> _control_ the environment, only to monitor it.

Thanks for the hint, I was not aware of the thermal subsystem until now.

But still wondering, doesn't have the hwmon interface also some write 
functionality? Or am I completely mistaken here?

>
>> Second question: Is there a good way to implement a userspace controlled 
>> switch between auto and manual mode?
>>
>
> Only if that is a direction to the chip to switch between modes.
Yes, via WMI you can set the mode to "manual", then you can use the wmi to set 
the fan speed to whatever speed you like. When it is set to auto, the EC itself 
applies an internal fixed fan curve.
>
> Thanks,
> Guenter
>
Kind regards,

Werner

PS.: By missclick I accidentally sent an empty email before. just ignore it.
