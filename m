Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916082;
	b=yeLlvcH2GzuJsQqFKnurtkIqOxtRC8KgT5iILFL6oPM04dwyGCB6n/9J2SA63w5p43FO
	 D5HcavalfyArMTszn192VpRHWWYYUjJAddvECsPGUyGb79lSTQUSgXLM5/WqbmKqEA3Ad
	 i21l5v+AIVK8UVqJrSbZkh2nKyOkzwZqwf4DBkU9zIGwERAP4sibmnx2j+zWnKoeWECsr
	 Z5DoT0yeMywrR4HWqOeGnw0KXiCd/iiX89tWjQ3y8nlKWsA346QyBDetHfaOG5lzTzyPY
	 la7IP+UlTWfGlN8D2P2qq9FFRSFnX8Omutyz9mExmCgz3DP8Yl1UNJFDw9LWaq7FRgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916082;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=TXjELWOpu/TOkx6iqzdKk3cP2+dl9P3m6y3yHksEdKg=;
	b=f+XGVkDCS00TBInpnEU/5NR6tOpu6o8q5unnISfKL6qOeLdVGOdTgcYLJZgIgcj1KOGi
	 Ir9+c5Q5uN6c0kfd6aIis8MM3n52aON28X6EOnBIcZWr3GfoF3xW9b2IMvzWXdx0lHrrq
	 rvNL9af4EViLxAsAO6A12/OtbEVsPbQ1ntPnjvXGYn6F1nKzPyM9VbU9zQa9c+zqaBicp
	 jtluMUj3VvcRTs4CGv/jESNnCA+bMsG57baxWb/zO3gQhGyR+ISS7AfZbWUmSSNu9uWgh
	 odrZIA1oq9XMZsZVEwDltDIXzBYPOmlaO1pbhITMqB+4YFYnyEDP3oLVYBLA+szQyCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="D8In1/0Q";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA932606A323
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 11:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D8In1/0Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D8A41F000C4;
	Tue, 17 Nov 2026 11:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794916082;
	bh=TXjELWOpu/TOkx6iqzdKk3cP2+dl9P3m6y3yHksEdKg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D8In1/0Q5lFUGjTV7IQXNTj0BoNd/JA9zyxDIPbjyTQaryIAquBivaoW5lKcZnald
	 ryHXHclnwmq1VNQiggZTYcqS6DjJdKRE+AAaHTUj4AH5zC5Rcx6pPupx0KbRLqicKb
	 J1PzrLox+eAyi8SVXWimtOqR6RalHd5vno5FwcvkPKi/pfZMbTz0XTPZpeY3JxbU4v
	 5lbULOF6PQdKfWejQiopS0EKjPBZv5O0tlc4SUlfZ5Epw7zkClT67hCE6xKVVahTyh
	 AIncN0Mj5P///G6VSsJr/SCKmloqcpSyOJOlQgDsxRXyLMQBXSmdMIrzub29H/ciAK
	 UIYYXWgubMobQ==
Message-ID: <sashiko-outbox-218728@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (pcf8591) Propagate channel access errors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Siqi Chen" <chensiqi@uniontech.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261117113819.3336050-1-chensiqi@uniontech.com>
References: <20261117113819.3336050-1-chensiqi@uniontech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 11:48:01 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] hwmon: (pcf8591) negative ADC readings treated as errors in
  show_in_channel()
--

commit d99106187d0cf00e871df0cbaf44bbf27b3630ed
Author: Siqi Chen <chensiqi@uniontech.com>

hwmon: (pcf8591) Propagate channel access errors

This commit checks SMBus operations in pcf8591_read_channel() for errors,
invalidates the cached channel until selection and the dummy read succeed,
and propagates negative error codes through the sysfs show callbacks.

> diff --git a/drivers/hwmon/pcf8591.c b/drivers/hwmon/pcf8591.c
> index ec98e6b66c49b..602d0caeaced6 100644
> --- a/drivers/hwmon/pcf8591.c
> +++ b/drivers/hwmon/pcf8591.c

[ ... ]

> @@ -81,7 +82,11 @@ static ssize_t show_in##channel##_input(struct device =
*dev,		\
>  					struct device_attribute *attr,	\
>  					char *buf)			\
>  {									\
> -	return sprintf(buf, "%d\n", pcf8591_read_channel(dev, channel));\
> +	int value =3D pcf8591_read_channel(dev, channel);			\
> +									\
> +	if (value < 0)						\
> +		return value;						\
> +	return sysfs_emit(buf, "%d\n", value);				\
>  }									\
>  static DEVICE_ATTR(in##channel##_input, S_IRUGO,			\
>  		   show_in##channel##_input, NULL);

[Severity: High]
Does checking value < 0 here reject valid negative differential ADC
readings as errors?

In differential modes (input_mode 1, 2, or 3), pcf8591_read_channel()
converts two's-complement readings via 10 * REG_TO_SIGNED(value), which
legitimately returns values in [-1280, -10] when bit 7 of the ADC byte is
set.  Treating any negative return value as an error causes sysfs reads of
in0_input, in1_input, or in2_input to fail with the millivolt reading as
the errno whenever the differential input voltage is negative.  Returning
the channel reading through an int * output parameter while returning 0 or
a negative errno from pcf8591_read_channel() would keep the two separate.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117113819.3336=
050-1-chensiqi@uniontech.com?part=3D1
