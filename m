Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFA73C0A02;
	Fri, 11 Sep 2026 07:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789111445; cv=none; b=UTGdvIbgCN2pUsyAbKqf5iB1wjkxTb7JCbio8GZ5TLIa7FS8iEE47EUKFS/9wJx5tZwNsVzasEukSQusYnFXyRBmzpHBf+lChUAv3u722m5TAOmB6BapsNIsQD81+hSag5/0AGCJguoo5sVMfrzk8HugcIjgKWP677qe0qndia8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789111445; c=relaxed/simple;
	bh=97rokHBydKwgMYL9TVYoZSPryrlhnJmyGUYNWTJtAXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XsdNrqmdoJ4rhbZZ2+mghHXG3OdJRdgx7JfaXIIxmjgdIOsXe/w36PE+e8YOiUTvcn1TkkaeIdUZFm8VPa3rrQnoI62arIYLUpLLRP+DSJazd3TdfWYXwAtIiHRXlQK7HLU3IosYNb8dwnJ81NnV48RH/i1FsagGpAauWXKbJI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GQKUTxvv; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GQKUTxvv"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AD3F6C653F9;
	Fri, 11 Sep 2026 07:24:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0885E601DE;
	Fri, 11 Sep 2026 07:23:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DBCD511C78B21;
	Fri, 11 Sep 2026 09:23:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789111437; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=TR1eFufT2tIBYHUvOprSBJScR9z2MQq4zCCp7IpiXkQ=;
	b=GQKUTxvv7DhYfYW5wkbgVPeO8+B7XTbvqJOZEgiXqA56lvrXy+iwUbQ3GU0sMHWHS+cntx
	dtgubciDeym8tjUhqyCIYKfsJbtsurBeak+hoOS6CthofjG7JD0vNH44hyg7yAU25lvRtk
	5xws+Ca4ahD5SBv17qhBEYr7QDAYVnk/gL/egg91CM1Ct/wJzDm/FmgWf7QLc6blJdVL5q
	B8kNzr68jqJQEVlwuTX6Cl4+Q8rtJzXSDOSraRg8RiBqrTBVJKNu3cqnk9sRkt1bvpW5PA
	yM16DG1Rv9mmrr/NsTbeRutk8ck8fstGEHkVOT7XNl8GonEGk/rHa1VuuRmZZw==
Message-ID: <21dbb615-25c0-457e-821d-6cfd6945a3c5@bootlin.com>
Date: Fri, 11 Sep 2026 09:23:52 +0200
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
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <b7a59fe6-f8a9-49ae-bbff-c3785dc19ecd@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 9/11/26 2:58 AM, Guenter Roeck wrote:
> On Thu, Sep 10, 2026 at 03:28:21PM +0200, Thomas Richard (congatec GmbH) wrote:
>> Current sensors on the Congatec Board Controller don't use consecutive IDs,
>> unlike other sensor types (voltage, temperature, fan). The driver assumed
>> consecutive IDs and performed a simple lookup, which caused an unknown
>> sensor warning. Define current sensor IDs explicitly.
>>
>> Changes the warning on conga-SA7 (type and channel are correct now).
>> Before:
>>   Board Controller returned an unknown sensor (type=2, channel=17), ignore it
>> After:
>>   Board Controller returned an unknown sensor (bc_type=1, bc_id=11), ignore it
>>
>> Cc: stable@kernel.org
>> Fixes: 08ebc9def79f ("hwmon: Add Congatec Board Controller monitoring driver")
>> Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>
> 
> Applied.
> 

You pointed me that Sashiko reported a missing cgbc_hwmon_info array but
you applied the patch. Should I send a v2 or an other patch to fix it?

Best Regards,
Thomas

