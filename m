Received: from mx.rxtx.cx (mx.rxtx.cx [185.235.143.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3764B3A3819
	for <linux-hwmon@vger.kernel.org>; Wed,  8 Apr 2026 20:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.235.143.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775680538; cv=none; b=Ymvnn43EXbHEYIH6OWPpf7YBbVoUQupnGh4HleHdoPqEdCX+GVRDBupIchvOoHbAb6jJL5iK/NQxtWMxo/YMIbLuLRfZDtEPemNj4CDERRRsSm4jidA65zcRIolNdkZfuoJFiWrfrOfUpz9scO/pTMDcQ3i6oOQyUc7PmttFjmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775680538; c=relaxed/simple;
	bh=gYhSxam0uGQhjp3WaLSV8gd2CMxRTxwtVY6EllHvp3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SQDI+rrbFjvKPAb7fafDGN45YR0x0XSWLQcS+Y4QuW4iDshIk+8inUElTx3kt28tCCyV66ZXnQ47+DJSNgaD5posslvTZi69XU6e1ZD4tdXf4DuMfru5H2tS5JYEJ84CltfZpfFiUPcV+X4thFpCZ0z9reTak38uCWIaEOtuLiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rxtx.cx; spf=none smtp.mailfrom=rxtx.cx; dkim=pass (2048-bit key) header.d=rxtx.cx header.i=@rxtx.cx header.b=I+Xz0C/O; arc=none smtp.client-ip=185.235.143.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rxtx.cx
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=rxtx.cx
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rxtx.cx header.i=@rxtx.cx header.b="I+Xz0C/O"
Received: by mx.rxtx.cx (Postfix, from userid 106)
	id B788D20613; Wed, 08 Apr 2026 20:29:05 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rxtx.cx; s=s2026;
	t=1775680144; bh=gYhSxam0uGQhjp3WaLSV8gd2CMxRTxwtVY6EllHvp3g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I+Xz0C/OpUzMQsEiu83+3L1Ez7zIQBWa+eBi8TpeeIbFtOXnMIReQ6v3BlbeByouQ
	 DKPSM3Ms54oTz8nzobWblabFNXgJeiDBLJ6OPgQsNcfV6DTU2Lat+Z6W8PkjJ8QIZ1
	 j7htNgYeyX8RZsoPFsXs1bL7FJ1xcQ7KbcbHpFDqbO+qT/25ils/FbH74hIY5txrov
	 59/e/GmTuNkL9HBiUQQUrNw1eKFW5iu633+PY5onOjXcJ5RU2RRRZPcYVRqiU1OIzM
	 MXEd4gucVxe/Gmwwl2+h/RCn4xjSRLzqEAOJq+Tj5OfhN4kNoQQxWRMuS1vWC2nzy2
	 h+FEZHQybKS0A==
Received: from [IPV6:2001:7d0:4d00:2500:10f7:e69b:fe86:ea8] (0ea8-fe86-e69b-10f7-2500-4d00-07d0-2001.sta.estpak.ee [IPv6:2001:7d0:4d00:2500:10f7:e69b:fe86:ea8])
	by mx.rxtx.cx (Postfix) with ESMTPSA id 6D1D620385;
	Wed, 08 Apr 2026 20:29:04 +0000 (UTC)
Message-ID: <25bbdd98-656e-407a-ada7-da2bdacb1aea@rxtx.cx>
Date: Wed, 8 Apr 2026 23:28:08 +0300
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add ROG STRIX B650E-E GAMING
 WIFI
To: Eugene Shalygin <eugene.shalygin@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>
Cc: Veronika Kossmann <nanodesuu@gmail.com>,
 Veronika Kossmann <desu.git@rxtx.cx>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260403210343.1380437-1-eugene.shalygin@gmail.com>
 <05e9870a-5d8c-410d-99ed-6ef9470b2ff7@roeck-us.net>
 <CAB95QATxrJa0koMq=BCjnXvLHJ5boRBUA+76FwqWJhmhEi-Tqg@mail.gmail.com>
Content-Language: en-US, et-EE
From: Veronika Kossmann <nanodesu@rxtx.cx>
In-Reply-To: <CAB95QATxrJa0koMq=BCjnXvLHJ5boRBUA+76FwqWJhmhEi-Tqg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/4/26 10:12, Eugene Shalygin wrote:
> On Sat, 4 Apr 2026 at 06:38, Guenter Roeck <linux@roeck-us.net> wrote:
>> Sashiko has a problem with this patch:
> I must admit now, that these _SET macros were a bad idea, it turned
> out to be too easy to misread. I'm going to remove them.
>
> Veronika, could you, please, show us the output from sensors with this
> version of the code?
>
> Cheers,
> Eugene

Of course:

$sensors asusec-isa-000a
asusec-isa-000a
Adapter: ISA adapter
CPU:          +37.0°C
Motherboard:  +38.0°C
VRM:          +51.0°C

These are relevant to actual temperatures.

Best wishes,

Veronika

