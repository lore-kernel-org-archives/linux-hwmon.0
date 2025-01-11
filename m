Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC572148FF9;
	Sat, 11 Jan 2025 18:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736619863; cv=none; b=eGuAm3sgiVc/W8Km4gzzN7ZP+e1P7VaU1MnGXYmbbQ4LemFJSVaMb5Ap90VOPm6gColJsH2WXygasqxyaFA2FwVu4FmSj8L42VRCcKgWkiB6RBgvf8c/Fqv8XdmBWBIg8v4tnRkgJ9vtbd7h3rx9o4x5BXojq263KaQ/ZRzMKhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736619863; c=relaxed/simple;
	bh=/Fn+hXMvQBdJ1w5MG7N+StbjDkzpf0aYsiqzzHUCISs=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=A/H0BhzNrnlgoT2opIP7aQoYb3uTDIIb9KYoZ+RHnKR7ssO6dYYDx1aHOOy03ZnEtX391H6MMZD6aEBQ9u2FMaCowcns+i8uwL7HRDylQxr9ew0gG3aC2RadOnarHgiqOEQj41pExyz1dH1F8C1qtaicNThCDA9KWmXevyimgAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id AC683C0002;
	Sat, 11 Jan 2025 18:24:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
	(envelope-from <peter@korsgaard.com>)
	id 1tWg9Z-00CN1O-2H;
	Sat, 11 Jan 2025 19:24:09 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>,  devicetree@vger.kernel.org,
  linux-hwmon@vger.kernel.org,  Jean Delvare <jdelvare@suse.com>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: pwm-fan: Document
 default-pwm property
References: <20250103101448.890946-1-peter@korsgaard.com>
	<20250103195810.GA2624225-robh@kernel.org>
	<dbf7cdd3-c5ab-4801-be85-163124b8a898@korsgaard.com>
	<20250106173805.GA501301-robh@kernel.org>
	<87sepq8mcc.fsf@dell.be.48ers.dk>
	<f6ee420b-7c3f-4a21-831b-619fe38408b5@roeck-us.net>
Date: Sat, 11 Jan 2025 19:24:09 +0100
In-Reply-To: <f6ee420b-7c3f-4a21-831b-619fe38408b5@roeck-us.net> (Guenter
	Roeck's message of "Sat, 11 Jan 2025 09:15:05 -0800")
Message-ID: <874j25dx9y.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-GND-Sasl: peter@korsgaard.com

>>>>> "Guenter" == Guenter Roeck <linux@roeck-us.net> writes:

Hi,

 >> Guenter, what do you say? This way we don't need any new device tree
 >> properties. I personally find it less clear than a default-pwm property,
 >> but oh well.
 >> 

 > I would not call that "default". It is more along the line of
 > "If available, use highest cooling level as maximum allowed".

Sorry, what are you referring to exactly? The commit message? The change
is about the default/initial pwm setting, there is nothing disallowing
user space to increase it afterwards?


 > Other than that, I don't like it, but since it looks like we
 > won't get approval for the devicetree property, I'd say go for it.

Great, then we agree! I'll send a v5 then once it is clear what your
comment above refers to.

-- 
Bye, Peter Korsgaard
