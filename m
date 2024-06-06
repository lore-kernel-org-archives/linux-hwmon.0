Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB9319AD5E;
	Thu,  6 Jun 2024 14:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717684234; cv=none; b=WhG6gWwzDXjEGqN6XhrfENbwBIhTssCXVmgozwuGayXyTqfRjSpOLHXP7ZAFg5MeKyc6xvLMd5FOIWuOjhel+p5C5NfDOEu5LnvIONVGzist3NhUva0fpSmoJx4+PA4crUy/OwOzwv/gRRCjh7K8rcUCdr4+y438yFG8oZjXTn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717684234; c=relaxed/simple;
	bh=OvnfEQO/21Hp0O519uSBy/WK6+BMymWF8Iu1zCEidYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u0BTaiOUVjpymH44olCgFH1wZcYUkZCRr5GbUAQWBsYydhbUA2YT5gKiLw3zT1jgPjJS87zanlGIE78WFjgubM1kPLBJjwO7TXv0lGegOWVfIfebjDNFpDde6sThutxSJozD403h7U42hd5rI76Z51PgtSwzHz6AC618dBeP/xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=VcWpyeBg; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="VcWpyeBg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1717684225;
	bh=OvnfEQO/21Hp0O519uSBy/WK6+BMymWF8Iu1zCEidYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VcWpyeBgOqzYo+lhsjYvWrRoBs+s2FGG7fSBHO8oAWErIz93Glkzhc8QScYlhq0gB
	 ZQ0AZgvBNHbdLqrtRPTr4UpzwlSvkT2zVYDFiohgrZukOfIw392Ex50103HHRg5par
	 qspoKxIu9dIkPl8xmUGkCvGtpUwbI4Y701sUsPEA=
Date: Thu, 6 Jun 2024 16:30:25 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] hwmon: (cros_ec) Prevent read overflow in probe()
Message-ID: <ea14f4b3-0785-46f8-8d8c-f4398c454b1b@t-8ch.de>
References: <42331b70-bd3c-496c-8c79-3ec4faad40b8@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42331b70-bd3c-496c-8c79-3ec4faad40b8@moroto.mountain>

Thanks!

On 2024-06-06 16:12:11+0000, Dan Carpenter wrote:
> The "resp.sensor_name" comes from cros_ec_cmd() and it hasn't necessarily
> been NUL terminated.  We had not intended to read past "sensor_name_size"
> bytes, however, there is a width vs precision bug in the format string.
> The format needs to be precision '%.*s' instead of width '%*s'.
> Precision prevents an out of bounds read, but width is a no-op.
> 
> Fixes: bc3e45258096 ("hwmon: add ChromeOS EC driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Acked-by: Thomas Weißschuh <linux@weissschuh.net>

devm_kstrndup() would have been nice.


Thomas
