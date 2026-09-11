Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C283B05A7;
	Fri, 11 Sep 2026 17:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789148018; cv=none; b=LMGSxw5tylHrDB5ZOa9Sp1yDdIKC648ob1hxZcagTKcPAUOvAWRHAcS/m223xrI+uP3oBZQxxhdh52VtC9ZKT63mgfR+BVlWix07ODvcOKFGGhFPvoq2qMvK5yuLyUAVzy7KDt1UKhOTVSYTfcq2kzwiioPtU7ytc96UWSZpVPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789148018; c=relaxed/simple;
	bh=t2P6gEt4evoMkyGrIm44XRmYDGEAu4Q8V1SKn0Y2Qh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RmQIb/cCWKuLBT+oLqnPD3ebLUjWLgadIfmkgNoJNeaVZhUYYlhI4UknFm5iixeWJH2eztvjoUYPHlIn9KPYp8q4DTDY2hrz8Gx6HsrSxffIOXFAsTVjVmK0q6F37zHyGblFY6Z9mlhCiM4mm6kDC0n7lMIF6K8YIo5NXsDgFTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=knkSk0nq; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="knkSk0nq"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B0D1E4E401F2;
	Fri, 11 Sep 2026 17:33:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8601F601A3;
	Fri, 11 Sep 2026 17:33:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1A44B11C7A23F;
	Fri, 11 Sep 2026 19:33:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789148006; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=t2P6gEt4evoMkyGrIm44XRmYDGEAu4Q8V1SKn0Y2Qh8=;
	b=knkSk0nqH/NAXZFymnHsGaON6T9DFYry4fxnpeEe2Ji1uevMkuk5jfGI0wkHKjko18I3jl
	f1a2Q08nH2n0JrIpMbnXFx0440MzbBRgkLkwtnor/KfsDw+HMTaBdFHvqKrLAR7Z0/Dp4Y
	qBA1+K/Oa5x8Xu9u6vpIWDO+CjC+E+J3h9uiXVd9limvwrFZL3Csq2/EmHaPbLoMQeZuUi
	uOyHfjynjS+AxC7v/ax2JrJwUAFmDSc0qpCYjlp6aw1T1D91JCEIDzoCaO+XdCLWnjgJ43
	ifF5q4fyBb4DEpVKhFzP9ELuVIbdoB+xaBXi5t61ZuOOVKycrktxchojoRTtaA==
Message-ID: <72007ea8-b033-421f-a78b-ecd4accb6f07@bootlin.com>
Date: Fri, 11 Sep 2026 19:33:24 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hwmon: (cgbc-hwmon): Fix current sensors ID lookup
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Werner Gartner <Werner.Gartner@congatec.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, stable@kernel.org
References: <20260910-cgbc-hwmon-fix-and-new-sensors-v1-0-ef13ae2fa147@bootlin.com>
 <20260910-cgbc-hwmon-fix-and-new-sensors-v1-1-ef13ae2fa147@bootlin.com>
 <b7a59fe6-f8a9-49ae-bbff-c3785dc19ecd@roeck-us.net>
 <21dbb615-25c0-457e-821d-6cfd6945a3c5@bootlin.com>
 <af677e7d-a605-4e63-8fad-6bf491dade07@roeck-us.net>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <af677e7d-a605-4e63-8fad-6bf491dade07@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On 9/11/26 3:57 PM, Guenter Roeck wrote:
> On 9/11/26 00:23, Thomas Richard wrote:
>> On 9/11/26 2:58 AM, Guenter Roeck wrote:
>>> On Thu, Sep 10, 2026 at 03:28:21PM +0200, Thomas Richard (congatec
>>> GmbH) wrote:
>>>> Current sensors on the Congatec Board Controller don't use
>>>> consecutive IDs,
>>>> unlike other sensor types (voltage, temperature, fan). The driver
>>>> assumed
>>>> consecutive IDs and performed a simple lookup, which caused an unknown
>>>> sensor warning. Define current sensor IDs explicitly.
>>>>
>>>> Changes the warning on conga-SA7 (type and channel are correct now).
>>>> Before:
>>>>    Board Controller returned an unknown sensor (type=2, channel=17),
>>>> ignore it
>>>> After:
>>>>    Board Controller returned an unknown sensor (bc_type=1,
>>>> bc_id=11), ignore it
>>>>
>>>> Cc: stable@kernel.org
>>>> Fixes: 08ebc9def79f ("hwmon: Add Congatec Board Controller
>>>> monitoring driver")
>>>> Signed-off-by: Thomas Richard (congatec GmbH)
>>>> <thomas.richard@bootlin.com>
>>>
>>> Applied.
>>>
>>
>> You pointed me that Sashiko reported a missing cgbc_hwmon_info array but
>> you applied the patch. Should I send a v2 or an other patch to fix it?
>>
> Sorry, too much going on. Either way is fine.
No problem, I sent a v2.

Best Regards,
Thomas
