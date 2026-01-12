Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CC331352F
	for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 21:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768253007; cv=none; b=lLA6hyM0uKYHESvFgSShAdHiIhsT/eHcA9Zw60r3O+NdwlzsxLoC1VxP7hqYv3qPeB1egW9rhRU7czNpLiBwr7isekVAm8Fg4gBI7Qgp623auPqHsqpaIE9XP2wC5p7FBfNZBFMhk/QHGMgVof7WtNDIkly2ixNrgxtLFl5HfGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768253007; c=relaxed/simple;
	bh=m7qJv/A0RFPCk+9TSdas0AfgSI14Yb+YSwRQMD/+clE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bh6gLQJ2VgUgRaCe4+psgDHtvzdp2YF10aja3CfGb+UPy2kSQc4la9LZ7kn5jUa6N/2ziVf6GhZzxmEbmW/5LjgCfPW1Cz+h4mxba2Hk8aHZS7nplROlTcU1eCGoQrelaAGdFV9qngqUNuh6+9lunMzqYuqcUlmHraNuQLQ9ln8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hd6Nttov; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hd6Nttov"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2b04a410f42so5898373eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 13:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768253005; x=1768857805; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2dU+8EOg7WTPBIUGN6/4u2LhX6wXBghSWFxnKxCkmy0=;
        b=hd6NttovLGCEObsPi9+E5Yy9Z1+gFYVFzAJoyHlVuIsHKn1wD/3snyGoWM+ibicR1r
         OLduiOdiXVEfaWFqZrSrtddkgpvTqQuhXVkhMEDsBED8dkXEmcCtYwGcp30l22mXgl8h
         2ZGa32n6VvsRokCZh0/rsluUGv+ScdZTuEQIuJsNK8+KTCB3PoQtjsZg+65Mic7k/hdN
         owLSuDR4BQWNm3AjERmI2TFxX4nNI5VIcieBzG9nce82T/IHkzRZ8VjtdNaltsuY4RKO
         vpmlyTCARyg1yVYkCI9J+O7Pp30C9ODpUrRQyFjJAYKR6M+n4IIQI52MmGycCIATwGnX
         zYMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768253005; x=1768857805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2dU+8EOg7WTPBIUGN6/4u2LhX6wXBghSWFxnKxCkmy0=;
        b=uxOP4bvGYHay+Wr898FUFs6kq8cFGMoMRkm2BtITPOqw4PF/EAIz4ebF3oRL1UUj1Y
         PGMy+4TFZ9B83Os9bqKJ5sjfSVx4WpNnqVD3yMVJ+loCiOwrzLDFFIi/sUCN+evQmjeY
         NBHeDDztSOtlRn3I70UUbvMlQ/qxw1lEYB4v3Mxl6ZoF4hohpedP5cZQyt5h06t3ZILl
         Tn+MBKtnUKspzuSO4a5WWNMcdfClYgDZcQGgRHi/jMNhDj63aQUQcqkUuF+RnEMli6Rb
         QpF/001gMHlpivP6kvHCR18Z3/LAR7ctWvqU+e8Gs2GRNhjNdkr3S2pxmUi6liT2VpiM
         4bxg==
X-Forwarded-Encrypted: i=1; AJvYcCX4TQFVUh96AGRkJeBNDtl0hv2VDpNHEJLEFy+PPWxklMPBjnQqyyvdxSGu2mEHmnjSrBlsCK8q644zwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPLWmK0HPt2YJB4PxT5UOV8mLZNMg08Uj8H4plSkBWiTe+ye4Q
	HO/u5AlzdocMfeiemN4Qa2sRtAC3XbDjHBVsBtWqEwEQE+YgjqjD+RP9
X-Gm-Gg: AY/fxX58Qp67+5W55yuXUWqnXplJOucaQiBg290w0N5ZNzjwnk0nsh3mjGNltSKxAOS
	tai5Z94pyr6j3NJL+EVW/Aqb+a/xcLE/BOrjRAOCmzSGz5A1/h9PTnN76bM0Y2/3Ozl9reCLdrH
	Vjcn3WvPwpdQnjcTLXHvgrFXyJSgFpxHCGfmrxdEPmqJNYySuS6rCCrkOoO9EJf4Mgs4elwoc59
	RLFZnQoJNuy0qHEP0aXbIqAlV7rrvtdwFM7bFJADZZjLInHQA7mcAI+/Y53QucZrCjJe/Plj5qC
	xf8Ge3vGFu8F3cDNkXD6bFSg9NS6gsn8FG14OszzxTd1xDLTqnmZHXdG0WcvYeQKOceazYcbjGe
	Mf/Lyp4VUpC8Qxhx39dExtv1GRXvvN3F/lGvte7wNSN5k028JdVdamubusK+OqxH0RQBDy6lVg2
	CWCfO0Lx57Fl7Yod6UoW3wrDTR
X-Google-Smtp-Source: AGHT+IHIfNucj9eKJFw2iym1fkRRiRYYTsTIIwBCfgzZAutd7GknDAuKGcB+WKb/ZDfOKrtHryzGHQ==
X-Received: by 2002:a05:7301:5f10:b0:2a7:83e:7b17 with SMTP id 5a478bee46e88-2b17d251f1dmr15719230eec.12.1768253005067;
        Mon, 12 Jan 2026 13:23:25 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b170673bc0sm17283602eec.5.2026.01.12.13.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 13:23:24 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 12 Jan 2026 13:23:23 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Denis Pauk <pauk.denis@gmail.com>
Cc: shoes2ga@gmail.com, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (nct6775) Add ASUS Pro WS WRX90E-SAGE SE
Message-ID: <bdca6426-6dcf-4fe3-88cb-97ad283166a7@roeck-us.net>
References: <20251231155316.2048-1-pauk.denis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251231155316.2048-1-pauk.denis@gmail.com>

On Wed, Dec 31, 2025 at 05:53:14PM +0200, Denis Pauk wrote:
> Boards Pro WS WRX90E-SAGE SE has got a nct6775 chip, but by default there's
> no use of it because of resource conflict with WMI method.
> 
> Add the board to the WMI monitoring list.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=204807
> Signed-off-by: Denis Pauk <pauk.denis@gmail.com>
> Tested-by: Marcus <shoes2ga@gmail.com>

Applied.

Thanks,
Guenter
