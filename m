Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CD82FFDD4
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 15:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760454905; cv=none; b=Rz3THewDahlDaHgWBI9HuzSkfoagyZY7f2e5QdIbwv82mPFPWC7HtCmaOiRANyBjH1OMHAOCjopPcJHjnXHDd+T7KVPcumQQemOb/Jaq3pjFz6JE6+ld0kUo90TTfj/UvdttQE74rCbK9StitXtu1CLjam77BqG/35xXaMY7axw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760454905; c=relaxed/simple;
	bh=2EO7+Mw86jTZ32ILWnabkRyWDVKXtGXa/OUDfDpKJjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CVjBRTeRaboJnzPHUwr922RpSIuRPy4bLvhHSjPh1bI43n2tbzj0+Rk8r6YiMTdTP2zq3MsjJFlhv4LvdzcuSEeCBkQ1QqGVl3Sxq9NdCf4fNvVg0ZVjTKuuZ8BmAu9OaRucT0n2lPCH6AyhB3qc9b8Nc81FXoNuSXmnRZ4Kfj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lcS0sOjc; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lcS0sOjc"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-77f605f22easo4775848b3a.2
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 08:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760454903; x=1761059703; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tsJaopK5XFjKmHQfNpGpFGBdSNc9d5lFVOS9F95Qcqo=;
        b=lcS0sOjcFwUPvH5ObTKys9yu8YkYKFDxDG6ghazz69iYBpx9NpTdDvibQ8y4LwWpID
         ACysjduopTaku7ke3zF+Kof/SpDoFrCrvyJay2omlvoOB3QLyj0Rr7jpLo9+i3Rj5Xv4
         eGVzF6ilUyXZhn6tnsq+TUuUzfokbdKFjsdU7Yz9AJyHEZayUdEEIB1/sx0rXb6l+Wmf
         t30wF3+RexFgzfn13h5yUYAhXjl9QI4sDF6t/TqmLo+IOJ4FJR84dCxQoShl9TO/C7Lr
         mgvCtrxbFhKhACJ9cLu1UlzmLqzpYTyLwUu2YtzwQ4/LdtTweJ77FHWsxMk2MY0ORoh7
         AKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454903; x=1761059703;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tsJaopK5XFjKmHQfNpGpFGBdSNc9d5lFVOS9F95Qcqo=;
        b=PqOkf1n0B9anwVXx8qdCFwqcKq1CN9N95dR/cdqNO1J/+me2TOTWWLLlrATUMRnXcB
         FkKQ7bM2xXxrHQ9GxLCaIAYL64H5BqVE8d8AgOraGBQO3ErWGlzpKefS3EqU4M9mgHVq
         hmfhlfC7jzzdHCuGmgvKCJIcFYlQKQ/XCehgbiotufxWiV7ov8yZYaqiVJOqRdIlHteV
         fFs6z4hV5ipfTX6XGsAwUS+2tOLMffjKtUqD0z2YrSb5mzLzRch3tip0wqTPyChBg601
         vEpdKOeB8dRUIfD1OeEkpC62JF38tzpx/+uUFNv32devHCktQMrQHC/98Q5YCxQNc0q6
         l5gA==
X-Forwarded-Encrypted: i=1; AJvYcCXoj9ZhpfHCnp4tqhHCWmWj6Hsep2oMjQMG4QJI4eTnU+39qJayKPQHAmgLAxNCFxuH0QNIpXQanRq+yQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRNXa3O3JQ90ELCO1dm8QruqqO6EQvZiAVQnZ9sOsS44f+6zQ4
	iyDVqBcsJ4FaNj5tXwJ4VYdqpnpk567Prsue6/3hoH9CA97/vgQgiLrj
X-Gm-Gg: ASbGncsTVyY3Zp1pmnqTbS0TDcP6B+VEt+yQXcYjf1mmJ6v2K1KTPEqCJsv4f72RX0t
	VueJHi56d8wYNGsaR9K+yKoIl3EDdey+9iibTynm51JPf9WPjJlbyo5s9gjOJP2n76++S947Pii
	RG3fCfoyuep/os5ZeE0K+mgYxIHDziZObMZFGpJWDXsAu+RJGrIqA59EC+by/GZY6+QWTPpVq6t
	ZAILexLKwF//U583Us8TLNaHpp6YtSmaU1yflgot3+go6IC2jSLTJ38f7RRU900RxgCC//L+jcX
	Y2RlAbIC6vjlTIPN69BC/bxa9foVDmFP+zq0b+nhrOlwB5/jWWmJGB5XlOyyl6voNGI2Z82pqbG
	NTMvyyylrClsiamxali/pEmdCVa3XI6GoWogl38RkcsXPbAVVcQfHSoq1vy6NjRKT
X-Google-Smtp-Source: AGHT+IGWguCBLqbqbMAjLBee+il9521eo9UWOowPf5VuIX+2bcsg+HZx1vn/fioij512M/cXcjIt3Q==
X-Received: by 2002:a05:6a00:98a:b0:77f:45fc:9619 with SMTP id d2e1a72fcca58-79385703e36mr28873914b3a.2.1760454902520;
        Tue, 14 Oct 2025 08:15:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b0604cfsm15625842b3a.9.2025.10.14.08.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:15:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 14 Oct 2025 08:15:00 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Kim Seer Paller <kimseer.paller@analog.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Marcelo Schmitt <marcelo.schmitt@analog.com>
Subject: Re: [PATCH] dt-bindings: hwmon: pmbus/max17616: Add SMBALERT
 interrupt property
Message-ID: <bed87459-d395-4517-9ea7-ef155c9af126@roeck-us.net>
References: <20251013-upstream-max17616-v1-1-0e15002479c3@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013-upstream-max17616-v1-1-0e15002479c3@analog.com>

On Mon, Oct 13, 2025 at 01:00:47PM +0800, Kim Seer Paller wrote:
> Add interrupt property to document the SMBALERT pin functionality for
> fault condition signal.
> 
> Suggested-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> Signed-off-by: Kim Seer Paller <kimseer.paller@analog.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
