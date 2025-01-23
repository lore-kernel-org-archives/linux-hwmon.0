Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B23315AF6;
	Thu, 23 Jan 2025 08:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737622080; cv=none; b=DOhZGsKj/MOw/ltJ9FKrLUXW6UIadC3MDkQD8nXddlbyXev26ZAVNDSyO/4HK2fG2N7BKVPPyzoWuJN+caFEx5Iqtd77Sq3cvdgOrQo0ECyU827KmHHROYij5NV4I5xnO3RIQ+rz0/PZWd9g2CSYWaaZWKkvuzFsEd0ovO4czX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737622080; c=relaxed/simple;
	bh=n+BAh08fVD4z19Wcdeq3qfIQuFbhUPaAqAZ6E2w6qKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g9OoZuMoajM/t3eDtYYtZy9NzDdDGZwmSypH+TbcuJ6BC3+zH784CxSpaHFB2akegozXJdeEjCE3mdKHcV2SzQukFvtJueGVgjgnd+sdTd+lgTxxJWNTsh7gL0oGuu5FmsPUGHMeUjL42Dj6rNO1pNtUuL2mTva8rMhfv9H3iHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bNHBkwM0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bNHBkwM0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 165E3C4CED3;
	Thu, 23 Jan 2025 08:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737622079;
	bh=n+BAh08fVD4z19Wcdeq3qfIQuFbhUPaAqAZ6E2w6qKQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bNHBkwM0Av8DnZEFzgc3bUVtPMa9s9JTpPLnUKYLmzMOtSivnhNkF5w056l555Znv
	 JTNzfI5wQ5KEZG7xJ34F6eIZY6jRMLnepBuP0yofU6vPMSymtC9K1810WT/Yso2SLV
	 se318h7cUgHQ+6/a2xHQqMgNlEFt61uGTUACegOdH3NgJDlsvtKefUYkng1UMuRfAS
	 UslkiwNmyer+L7PFxbi+RK+SA6mMaVe5kAVNNGZh8p2T3xowDxKBuJfgWdZNCGD+e3
	 +ZyAmYTRHsyYxTU3MYgJrzrz31jnwXJway7g3XS2Z2Hy+N4GRKq/9icy2/ah9IaLuT
	 lP1fVpx8oDGHg==
Message-ID: <9cc5cc32-9e21-4b95-9f00-a15d690c6d57@kernel.org>
Date: Thu, 23 Jan 2025 09:47:53 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings:Add SQ52206 to ina2xx devicetree
 bindings
To: Wenliang Yan <wenliang202407@163.com>, linux@roeck-us.net
Cc: conor+dt@kernel.org, corbet@lwn.net, devicetree@vger.kernel.org,
 jdelvare@suse.com, krzk+dt@kernel.org, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh@kernel.org
References: <0eda52b5-59c2-4ad2-bb2c-5846dbfbf3e9@roeck-us.net>
 <20250123075802.1105859-1-wenliang202407@163.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250123075802.1105859-1-wenliang202407@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/01/2025 08:58, Wenliang Yan wrote:
> At 2025-01-23 11:30:59, "Guenter Roeck" <linux@roeck-us.net> wrote:
>> On 1/22/25 17:36, Wenliang Yan wrote:
>>> At 2025-01-22 15:59:02, "Krzysztof Kozlowski" <krzk@kernel.org> wrote:
>>>> On Wed, Jan 22, 2025 at 09:29:39AM +0800, Wenliang Yan wrote:
>>>>> Add the sq52206 compatible to the ina2xx.yaml
>>>>>
>>>>> Signed-off-by: Wenliang Yan <wenliang202407@163.com>
>>>>> ---
>>>>>
>>>>> Add the meaning of 'shunt-gain' in SQ52206.
>>>>
>>>> You already sent v3... and you got comment from me. You ignored both
>>>> Conor and me, so me doing third time the same and expecting different
>>>> results would be definition of insanity.
>>>>
>>>> Please read carefully submitting patches before posting new version.
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>
>>> Sorry, I have received your comment and 'acked'. I was originally
>>> planning to resend [PATCH v3 2/2], because I have not received a
>>> response from Guenter Roeck<linux@roeck-us.net>. However, I forgot to
>>> add 'RESEND' in the title. Thank you for your patient reply.
>>> I apologize again.
>>>
>>
>> A resend after just four days, plus dropping all Acks ? Are you serious ?
>>
>> Please keep in mind that not all of us are getting paid for doing this.
>> If I am otherwise busy, it will take longer. Sometimes it will take
>> much longer. If you resend a patches, they will end up at the tail
>> of my review queue. If you drop Acks, expect me to dig it all up,
>> and figure out on my own what if anything changed, the patches will
>> end up even further down, as in "I'll look into this series if I have
>> nothing else left to review".
>>
>> Guenter
> 
> Sorry for the inconvenience caused by my actions. I am just concerned that
> you did not receive the email, and I will continue to wait for your review
> and correction.
What review? I am telling you that you ignored us twice and I am not
doing the same third time expecting different results.

How did you respond to this:

"Please read carefully submitting patches before posting new version."

?

How did you respond to previous acks?

Best regards,
Krzysztof
