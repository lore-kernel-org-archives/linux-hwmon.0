Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E12215687D
	for <linux-hwmon@vger.kernel.org>; Thu,  2 Oct 2025 21:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759441109; cv=none; b=eUPL3e7bUlAPQia6V/3k8BDKqmbMUylm8moLasEo0UFu43Qr1S+LgonerDE3AZMf4lELwXV0LAz2GBw3v1ou2M/JP3TzipOI8nhKpiRcofYFZvJKL5391oNU8YrGQMvptFrTtdy8puP6mXeo19RQ0r5SAQWpuu5EdnoCdTiccDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759441109; c=relaxed/simple;
	bh=9dF0uJ3ISA22smG2brOHKcN/I7pK9c344S34aWAoh5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=reR+JwoCiYyY9h9nF2qLflDIdqiSIzgEGtkWN/Ub7sX9OsQe+9TOYrNx6GBNE5KvVn2cTKvgRN3xkiF8xuc1ejh0k6740Uk+4vVDcENuqgy4D9GvGh571k5kDPEmYlWZuTPaJ/8VKFdgRanwj5xGGEghWJg7b5yesEyr3tQtORc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AkmelcSG; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AkmelcSG"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-781001e3846so1528558b3a.2
        for <linux-hwmon@vger.kernel.org>; Thu, 02 Oct 2025 14:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759441107; x=1760045907; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DIgw2TUDYPujfob1ItVYazOFg+arl5pUESpq99Cor8Y=;
        b=AkmelcSGRu3932uTOYGDJEADP0HTBJOxNAfPgccn2+o6RdZ8YtVXo0CDAzlZ14Xvc2
         XZRbfX1YLFNG48memWUdjuYGcp/m2hKt5GytLNmIE+6OWaYfNcFLNHYPNsbWCCrHkX1q
         7criSdxCPrOUEp7L+0htUYmfrPb12WwUa9VBwMNXYCvfZDOUCaHI+PC5DTVgl4A0tap+
         jsqTkFS+UlSVvD9QVgyoHlbVKTvKrP5u4xlqqJ+DoGjrgvRZPrkwtTfgrTjOa/WTpVv7
         MIO2+lX9rwFJR9N1iNveYowQDWut6JvP9PUIOcxvCzkKtqEstcQrKk8PXjDm0/Jhokrc
         2sxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759441107; x=1760045907;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DIgw2TUDYPujfob1ItVYazOFg+arl5pUESpq99Cor8Y=;
        b=gnatYHVNTM5J81avCVTbTqhYV1zsOVSkiSyoIE6WSGbwqkHnw9g1Y4taj0SVPlxiFc
         zGtzzd+pLZ+GYj2CeQA4+jtSaWGHFj3ThhuDPVb2Q765bSaUaExUIQuFvNnp4Z8MS2vr
         Y03nXGIODR9LMGVKqp0SxR/NCIQ8g4N+ukRzmgEff9LlgmXwF4Qte0skrjpyVSjEiDKk
         ZXyNFGUGUCXtk2abLxSRTWSKL2OfGbmeZd/t1DAVzRo70y3iNSB7r9CtVO8L6fiY13jx
         IU9Gm25hCJgnLpve4e89pAmLVlqhJyhDnu1gd3xROOpHopqgIcOXWIvo+nEyOSHiV9P5
         8pDw==
X-Gm-Message-State: AOJu0Yympv1FA3m+2oP7T7jFT3HVsQUGIeNrs2maEC1rgADfWCek+DIV
	WH5is/9ZigENKtkFn0o2H4HWMskRni4cz0TK/t1qA6U5jAXO81BAAa8Q
X-Gm-Gg: ASbGncu070VrmXsWberG5sFP2Irrshq1vpFh3zSCxw3hcG9QHGbq2Nby/p518odkj/Y
	lk+3zcoVMUG+/s/UEc/3V+DsdNsaVFw0F4J8YsFDVNkmolAwwxpCRezKUyOWISqAUQH8LqOeCfb
	KJQ9jJbJWEdWZRGpFEzPDRP5+gN2+LylYtWiTeOydf5qbKEDoqD6wS9Qaxdf3L9MbNDpI8Al2jJ
	IeLR4dA3lAPWOJrghKX+bUpeka2BCXzs/usH6XtV3pvLNsKHKeBywBGHKiG85betqXsec+3GXn4
	GPoCMGeTF5yBbSjUYgvTNqHiDPEuYDPfO3cwWoNzm+OZW2NlfYGISmGqYT23rhp+FEuH+zVyOKV
	SD13MdAkuIfZPNYX32gUajNEVwxyuGeXRirLP2cGgNtczlNGNS4ea9ra0e7Q=
X-Google-Smtp-Source: AGHT+IHKI+feEMtSNCRgXeWWSvyIHg/eMcVz9KANAAoF8cg8/wBIuazCOx9v2nwjg3cKvHoW9MEgFg==
X-Received: by 2002:a05:6a20:12c9:b0:263:1c48:912f with SMTP id adf61e73a8af0-32b61dfb34emr1222197637.12.1759441107306;
        Thu, 02 Oct 2025 14:38:27 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b02074549sm3020231b3a.76.2025.10.02.14.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 14:38:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 2 Oct 2025 14:38:26 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eddie James <eajames@linux.ibm.com>
Cc: linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, andrew@codeconstruct.com.au, joel@jms.id.au,
	chanh@os.amperecomputing.com, jic23@kernel.org,
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org
Subject: Re: [PATCH v7 RESEND 5/7] dt-bindings: hwmon: max31790: Use
 addressed fan nodes
Message-ID: <c7c23305-d53a-40e1-a783-9ea8598c96d0@roeck-us.net>
References: <20251001144441.310950-1-eajames@linux.ibm.com>
 <20251001144441.310950-6-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001144441.310950-6-eajames@linux.ibm.com>

On Wed, Oct 01, 2025 at 09:44:39AM -0500, Eddie James wrote:
> Since fan properties can include reg, the fan controller should be
> able to specify address-cells and size-cells properties and use
> an addressed fan child node.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Applied.

Thanks,
Guenter
