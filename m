Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D979D3A1BA
	for <linux-hwmon@vger.kernel.org>; Sun,  6 Jul 2025 12:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751803718; cv=none; b=HfnW1zUoYUKWYk6Ri6xfXxN8sob3n5Y6Ih5ppO9CF3xTpIjT+0zIInuUWQF+yF68m8Jtp0dtE46MBkCU5R00LPZdRhAMIFRJ2kd/V8R5DgWwQ5Irgp0XZHye+mwSVv/HmZqC1mF7VCmiRIsOBk2L+UNaQcNB+Mf52bQtaPLtbAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751803718; c=relaxed/simple;
	bh=WwxK9vvT7sv6H6ia+HfWEIMpbR96EfJ29srJOvyJKGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lyTFZMc8aEA4MvIHxeLeHOk7e5hIhivi3uUXLzYsJWHJbAyjzOiFuhOqrwQdWF5SBF3uziYF/78h0Q3X3f3KkK9ddcrT6/toMTtFceIqJoKLKum6o4Iue5wvpg9CbJDF/Q4loDQxUM4umVm3mkSRyOpXq1q05ZhaBRd6PeP1dI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (3072-bit key) header.d=posteo.net header.i=@posteo.net header.b=CQLZbZ2n; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (3072-bit key) header.d=posteo.net header.i=@posteo.net header.b="CQLZbZ2n"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 40639240103
	for <linux-hwmon@vger.kernel.org>; Sun,  6 Jul 2025 14:08:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.ea087b; t=1751803707;
	bh=Zn02TNCl8ysiE/NE44VnhiT2tVvwiZX6S3B27JdFzZE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=CQLZbZ2nUFYvZEEgG+H/qKirYTnEapPqMiZjV0XOU6uJ9P94tQMtM81eV5PKKDbb6
	 06+PxKwQCpeWrE8NH4cnUmB70zaUC1R+mG7yhebAdREJ3r5yTUiYNe+/I/F5WzHQlp
	 7b6NBPhUGTS+XOp8K5O5irc/CrHH2xTqiO3KM5n05yiR+cIt/yvFujky16CeQMBJu6
	 mB8PqiUBZMe++pDBev9aW9j7mgwD7ULK1CUmKqoLIN5WqGnp1/DD4IpwkQ5XcEa/EJ
	 4hUHc9Ri2JVdt28Ca0xo/ULi/qL6psZhSHqTgP6hLKrQSZ3EyvZ4Fsn/epnc3sqfnw
	 +ZDEpIXRk9aby2MTBm6rr+XL7s7TBOQhsYE4K2WG7LjASKkyjMh3ZTcVegUTFBld7r
	 DCSlLEgw4NjRCKdnNFAlcorzLZMXN/bEd7nsocXFo9prOosWbIDEbfv+BxBlpKVJIq
	 b8SWyWEyEwC/7Xj8N+hGoz3roCeafxEx2QVDl+7hEPqr4A3rYXP
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4bZmNp32KXz9rxF;
	Sun,  6 Jul 2025 14:08:26 +0200 (CEST)
Date: Sun,  6 Jul 2025 12:08:25 +0000
From: Wilken Gottwalt <wilken.gottwalt@posteo.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Shantanu Tushar <shantanu@kde.org>, jdelvare@suse.com,
 linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (corsair-psu) add support for HX1200i Series
 2025
Message-ID: <20250706140825.6c385bb3@posteo.net>
In-Reply-To: <1c4b6a07-1bd7-411f-b4a4-db202cb21b46@roeck-us.net>
References: <20250630201444.210420-1-shantanu@kde.org>
	<20250701055337.14e2f5da@posteo.net>
	<CABQ4Km_Ot1097OjNvvKNyYhxjqu5cD4JTZ0NoaQv9SOcWyE8=w@mail.gmail.com>
	<20250704084003.21256f66@posteo.net>
	<1c4b6a07-1bd7-411f-b4a4-db202cb21b46@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 5 Jul 2025 12:19:05 -0700
Guenter Roeck <linux@roeck-us.net> wrote:

> On Fri, Jul 04, 2025 at 06:40:03AM +0000, Wilken Gottwalt wrote:
> > Hi Shantanu,
> > 
> > don't worry. That was only a comment/mental note for me. Looks like Corsair does
> > a lot of refreshs of that hardware. Hmm, but Guenter seems to be a bit slow on
> > this one.
> > 
> 
> Please remember I am _not_ getting paid for this job, and once in a while
> I need a break.
> 
> Guenter

Oh sorry, that wasn't meant harsh in any way, I just wondered.

greetings
