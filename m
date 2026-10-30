Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793368463;
	b=Jsy6muQdgLtsh7QY64d9JTFni0bieSRQQbEb8cRojGaKjcWsPbfLewdFSU5BdcxXvW14
	 XBvG1HP5rQykdvLMchx81bPgmtIlKbY7eAm+4Ta4R3zT/fw+cfUId/4cC7O1RBYODuI73
	 QYXFngvvesQH5Rm8QvjxsE5qqOZacsj9OIcnp7XzCRc3V5vyzsOEry6kturA5GyyQKrrJ
	 04yIVNUnlk+CUZPhNHZfMT/dv5FfbwrZnTYN+D2wpDKRWklN1P86tD98n4gic6/8Gf9Db
	 sQMcvJRSuJPDDKRGDVRhLVLChCurWD9h4GB6HZ8f+KZnicW6jajSRCCWnEuqvgKlh6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/hIuaSXC/8qKVAwXvaUJ1vLVQZIbwa7mDnRwYchKUok=;
	b=oblJ/pcdF1mdzMqZvXMd+YTi2bH10v3/4JMPaFqmUjLmNbClvUjSs9le+qfQzHZnpxIr
	 IBCTjlj0axDG9nqEW2OKiSgv1BrLdRi+bKJiTVzSqyCjYgadHHE6QNObKmahP3bYjNTi8
	 H/Ke1XW6mNRW8Yofi0zuzMBhXsUs2v2Vh3elsEdc93SRyT1ICh0GOcBDZGX+ojyHhoyoA
	 4jxKWuiUTpoUr7fgaVRKcZLVKlEwBAgfgcIKULkyODC322bYP95TFH+jAw477Bs9qaRwD
	 0JIMZBSwMEtYTHsilYQss5dkmRRkYviW1CmJT0Ra4P+kHsPrL6c9gd8GF5OeQ3nfoJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XWaM6t2o;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA348606A320
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Oct 2026 13:54:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA348606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XWaM6t2o
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso8410935e9.1
        for <linux-hwmon@vger.kernel.org>; Fri, 30 Oct 2026 06:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793368461; x=1793973261; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/hIuaSXC/8qKVAwXvaUJ1vLVQZIbwa7mDnRwYchKUok=;
        b=XWaM6t2olUZqZIxFriVejrYzehUyFljQN5E2CvGc2lNTgSVwJI5hIRBfuMBSzYJW1b
         573FOamRVec1VCMzletpzIxN7E3qGFoLJjVRSWtq0Lg78fbMdn2eGoHbT9tpuw9eKDkb
         hOI6+H/tt2KyetfMO7tK4BJUqLfd2n0gHAw6pZ2biqL5A1JuXRWsNqOeHLx+rByImhzv
         RSfl6WCRNYCVJIXSK6BE78UHY+WWI6kJS+Q6a9blv1tMTv+RJoO0dI7kE9Lcm5F7Frgm
         VeeaM21RYMDPzOqVzVtvdhncwp35WhxDJvWrR+HwCT+mVTFh8BL5Ke8mkmkbnyPnrd9h
         LJ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368461; x=1793973261;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/hIuaSXC/8qKVAwXvaUJ1vLVQZIbwa7mDnRwYchKUok=;
        b=H9GImCi26XCRZN6lelfy3/oMGG4pAxQrWkbCKa3OQrOArlSznz1dyfCEkdI88XAagK
         2URUf+SgB25yIDHJSzwEk8oFkEh7k09ASJh7glYvNucpKHcPpQl5dt4915K56fXma348
         U82Ax1aCF+rFbkh5gxQ5DTy6jVk3h2b7PpPIRWGRLUKnSE48HzkeiNKTqIR/bkWR89B4
         jghdkHu4IVjRxKAE/Q75S5AzG6LoJGHHqGY6N7ncp7hAiLTLgBbMEVYbu9FnPhVv5Z0C
         ppRnu2irVZGfYZZYhPJzJf6agKqnQvSnoqIJlHZlIdLN+vz972kfpWFRT6O/aQhivB8F
         0cyQ==
X-Forwarded-Encrypted: i=1; AKwUvBze2mWu+BfLIXsG52EzZ08wiAKhR9TspkTaB4spV2AOMaCQFJLZ9ww0kEbVUATr3k/ADhchxODh/8fEiQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJPe8Mw+G6CtI5EKrqFT6p4+sMGyfBvwkWra8sw44HAH6TDEPfx
	TsbqnjQvzgtzmyhLuTRQpTVcGHbp9pAujFMgRDBl0NwirnEj/d2MReLy
X-Gm-Gg: AYBFou0oAhPaXSaNW+eiHyPTtIh2QVwvQxje70TGtLSgAEBI13tX8bGWP796IA0qMQ/
	yfmhvpr/THeiC7aczH1ejySmz86WwQpCRoFTvy6OwcWCmCFzijkJpBcBoh3rWPqKsM969k9FtfW
	mDkKPjMK52xK/uKZ4y6MquASpEGXmSL/lWH94f68Ns/oyNxpNAcGZuJ9W0KzsI4GK9en1gnbaYF
	LsJ/gyIl6k4LzFJnlGoEBZA8HEUC5RkOvugGJFKOt0lLv42ioOjapVakHYeH0/C4gJBSEOlN1IG
	SoiSslEb5uapRgf8HiK3e4thvYj3IOL7uvitemvBCPtBuFAmmpseIm4KjyLK3W+7g5jvRhH5y3Q
	RpYSbQk6EdOWug4656t/0dVXx7JJbqiRiZWQfaYCSIFRCitvHQed3thZ5MwOcOmcpUH3SwdyrZz
	JrjXBwubY4HZru0C++0wEXxQ2mdaYuwVJmGhW5DEfOXsPA3eV5egEP7MIkvv9Shcc2dpoV7n4KL
	oRRACLOqWZ2/ht54ry4AoE8JSQ7n1ILCLBnJPk1twkDCfA8TgssbvF+LnL1Qk/0D8sRQfiwoed+
	kzRdl6bkcrofkS/ICXN3AciOYAoJQFULQqkBDTzd9kyzJLaieJLM6fawSjKisupogak5ygHTPac
	3LqY8oFDxcbEXchtoqccKujjMw3cvfR7CkqKFTpb0lnr1WVbPwGOFE08hSIof3XQ7+e8=
X-Received: by 2002:a05:600c:608c:b0:4a1:6c0c:ab93 with SMTP id 5b1f17b1804b1-4ac190497bamr46672575e9.28.1793368460933;
        Fri, 30 Oct 2026 06:54:20 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac0950d533sm34613455e9.3.2026.10.30.06.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 06:54:20 -0700 (PDT)
Date: Fri, 30 Oct 2026 16:54:16 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alex Elder <elder@ieee.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Frank.Li@oss.nxp.com,
	Frank Li <Frank.Li@nxp.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
	Karol Wachowski <karol.wachowski@linux.intel.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Alex Elder <elder@kernel.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Guan-Yu Lin <guanyulin@google.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, netdev@vger.kernel.org,
	imx@lists.linux.dev, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/1] PM: runtime: change stub pm_runtime_get_if_active()
 return 1 when !CONFIG_PM
Message-ID: <auShiOI6Hmla6XxR@stanley.mountain>
References: <20261029163044.3062958-1-Frank.Li@oss.nxp.com>
 <auRb_r8ZSSU-eHZA@kekkonen.localdomain>
 <9207a52e-2d42-4e10-b777-2988e84d7dbe@ieee.org>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9207a52e-2d42-4e10-b777-2988e84d7dbe@ieee.org>

On Fri, Oct 30, 2026 at 08:46:07AM -0500, Alex Elder wrote:
> On 10/30/26 3:57 AM, Sakari Ailus wrote:
> > Hi Frank,
> > 
> > Thanks for the patch.
> > 
> > On Thu, Oct 29, 2026 at 12:30:37PM -0400, Frank.Li@oss.nxp.com wrote:
> > > From: Frank Li <Frank.Li@nxp.com>
> > > 
> > > When CONFIG_PM is not enabled, all devices runtime PM state should be
> > > treated as active.
> > > 
> > > __pm_runtime_resume() returns 1 (called by pm_runtime_get()).
> > > pm_runtime_get_if_active() is the try-and-get version of pm_runtime_get().
> > > stub pm_runtime_active() also returns true. So pm_runtime_get_if_active()
> > > should return the same value as the stub pm_runtime_get(), which is 1.
> > 
> > Shouldn't the same change be done to pm_runtime_get_if_in_use()? It's
> > otherwise the same, except that it requires also the use count to be
> > non-zero.
> I think "yes."
> 
> I think the logic for !CONFIG_PM should basically pretend runtime
> PM is enabled for all devices, and they're all ACTIVE and effectively
> in use.
> 
> That implies:
> - disable_depth == 0, so usage accounting would (if enabled) be done
> - runtime_status == RPM_ACTIVE (power is on, no delay)
> - usage_count > 0
> - runtime_error == 0
> - Maybe ignore_children is false?
> 
> This might not be complete (and could be wrong!).
> 

We could add this kind of information as a comment somewhere?

regards,
dan carpenter

