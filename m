Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADCA4DA55B
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Mar 2026 16:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772554992; cv=none; b=P8K2Sc0mJGbCIbCfkjdeE0in4rkk1q6HqYWRnd3e+h8A56MeGYbEdPNl0If21gC9CnejhErPRe9u8DIxAM08cS50EwekiyhTzAvXZZRer3A6CoCAkjzoHErx/rjWrrVEPhasTxk0KPQiVvczppH6JdjhfR9h4TB7eUrPk7Ws5x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772554992; c=relaxed/simple;
	bh=QnDe6CqK7d7iv5p2X8yN4ClZilCQfBmh+Ih5CDsKBrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DFq4OzvyGyx06fbe8kiNSq8qBHn3KGVab3UUU4q3dCWvIG+Zh55F7rj1oyfda5IJhFltofgDzAyS0GaVxSifuM2oku7ud+QHJxpKF/IqX+WuINzDHs/tA2N85GtxhSfvj/Low70hZocMeosaow1jnGlnVaNuwp4cU9593OEogHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hdg81eCG; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hdg81eCG"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2bded9bf7a7so4003815eec.1
        for <linux-hwmon@vger.kernel.org>; Tue, 03 Mar 2026 08:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772554987; x=1773159787; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=42DkLzycZBouCea5OS9Ta3kLGIhHRc8gf8Jgyx1nJCE=;
        b=hdg81eCGlojV7urUqIv3aXLNN8u38KycLiJWH0Pc7D7u3XlpZLxazhzW9b+a919MGj
         RwBeCf+nYNHswNM4u+0eRNhOgZt+guWVv0akwBYmkWtB6YmlntamMMTzrFSqYJ9UeMfq
         fxOEg0BxT+zQ3hVrbPS57CjDcYTyunIQRyzRjU1ePz4yeeGcOiMRsgkHCpzo/rRGzozC
         KbnGM6xUQV9SnWhnL+uIT4E6Xmpg+BL6Y0kFrVhLiN9A0kKXiIMfvXDglzeATUBIkD7f
         FDasTSS20/plWkAnMmcM/Pa8fVQ4WhnQ3inRpgKFiQc7AT9oAG2FzwkorV3rlkjbfhSC
         TXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772554987; x=1773159787;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=42DkLzycZBouCea5OS9Ta3kLGIhHRc8gf8Jgyx1nJCE=;
        b=X1N1w6rLe6qffQKOgZqn5nDwkIliAwDhxRwno6ONoPhgW8cNNp0ZfyVMW5a1eTve7n
         RvMAsd6Jaqf5flaUwNp9005qxI/am3puuUh4RkGBENjNUn9ubdW8qW4UUJjhATAYMIC5
         STkb/On1vgpXRbLESyNtqVss0k0RDa+C1rxJGscnbvtO1ZFPZfCzDq3DIMFkUNLiCjA3
         y5uEwFSbi3lWzY/nhIDXRhG+V6tLlqHzBxRYTn1mDdoY+rjqbb3jK5yggiMrbzI48Mjz
         6hL7ZoIttM4XzOygUi2pAKyWJ5XIFlX24A9KAkUVa74xdaW5U3LYWjo1HawVT6e/S9Y1
         Kwag==
X-Forwarded-Encrypted: i=1; AJvYcCVBsGUC2m8j2T8zAsklKW7QTOWEUAHp8Df+WxQ5bW2XCZzFvQGvdK/1vNswg99HpQouL4+YodYLU1Jdxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJpC9C4SdCuhF/9/VLwofRBGGVTKJ2V25i0UPtNKeed+2Fzzjw
	er+lgKr0wnDBH3UtL40EFG4YLjIKCJXWQ6uAs0Kr8U+CdH5ek6onEy8R
X-Gm-Gg: ATEYQzwrGAwW7IFIGH4H9KeuK4SQiYdYs3BtKIUeeMfQueZxDCzxGe7EOQWMwVDx4yh
	iL8xqhVP9xhx69pmexKQQBsI5aBLmwt2DVmDkPOxrEd4uuwu2t2mDdpLMiJ/Uw2f5Evd9AnIyBy
	+ijVBwPx69w3Y+Ycm7q5r3HRDMYXYfVXTnoVl0EgnzQjnBIKhAYaKB3hhEAj0++51D/JTqXR2UC
	+msbYLY00JD2ioR/rP99a+GgMM+EVM9Qe7M8JMh53F7ZMbQgHCrBgqefcBCtgvoszhxrVW+gsjH
	9uC5JiTor3xOXXbQX5uHM4pMZVAQMiD76P4P+bwf9uxOldIyhCw09815zQDssiwIn1UagA/tLcd
	YzQUdvmYutCaOigqF1NWD0aKkCSZya6DZt2Fj+u1QBI116A5gfBBR/IvGscaIO2IhNsaeOMIZKJ
	XX8TbbsthBomOq55l87N0RJ8e5As2Xq7nwJyN/AHfJpRhCyOY=
X-Received: by 2002:a05:693c:8151:b0:2be:2b16:b99f with SMTP id 5a478bee46e88-2be2b170190mr181320eec.13.1772554986631;
        Tue, 03 Mar 2026 08:23:06 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1cefd7esm14967005eec.9.2026.03.03.08.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 08:23:06 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 3 Mar 2026 08:23:04 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, hanguidong02@gmail.com,
	ysato@users.sourceforge.jp, dalias@libc.org,
	glaubitz@physik.fu-berlin.de, abelvesa@kernel.org, srini@kernel.org,
	s.nawrocki@samsung.com, nuno.sa@analog.com,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-sh@vger.kernel.org
Subject: Re: [PATCH v2 3/4] hwmon: axi-fan: don't use driver_override as IRQ
 name
Message-ID: <b46c5757-b67d-4949-b8d8-54b799464b5d@roeck-us.net>
References: <20260303115720.48783-1-dakr@kernel.org>
 <20260303115720.48783-4-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260303115720.48783-4-dakr@kernel.org>

On Tue, Mar 03, 2026 at 12:53:20PM +0100, Danilo Krummrich wrote:
> Do not use driver_override as IRQ name, as it is not guaranteed to point
> to a valid string; use NULL instead (which makes the devm IRQ helpers
> use dev_name()).
> 
> Fixes: 8412b410fa5e ("hwmon: Support ADI Fan Control IP")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Nuno Sá <nuno.sa@analog.com>

Applied.

Thanks,
Guenter
