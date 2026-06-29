Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B501C423152
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 15:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782748253; cv=none; b=NxBmRhJ5AuCt1lPmIqiNXMisbVISMB6iF49/1vShsGe9IOe/mT0DCaZKjkW0MGl20gM6blnABIiMekEgzDaSrPwQ0qYl8eYLk0J8gRyt2aFNsq3EWPk2bdM/TI9BmeEF6iT0G8tgPeYZyjRNgU6QuK2bx7AadyjK41/QrhaZMrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782748253; c=relaxed/simple;
	bh=9Z/I59i/RjQ3sMJpWs01Pnk3YZnrHp4Sx6WN4YxZkwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kw4rWmnQcLlVr9O0zfQ6r1CfndGeaeOg96s9vZ7uuBZSPm+dDtV9QuFNIE8iSldurXTR440OchJsIy7KSrVA58bsJqUMdfXyU0aKZMQ4hgWiJNjcFag9kVJwRDY7AgVAtMnjnusYDNPfZanb0HcxeawiFIxabikUuJ3crbcGGuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dxjr5D/9; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dxjr5D/9"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-30ec3dfbcd1so2039289eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 08:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782748252; x=1783353052; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cbT/MmV5kCCoKkbsAET+KqgtV+IxC0WLVD07qfPPpL4=;
        b=Dxjr5D/93oBFfGPvU5F680mNWyLbGZH0Fw5BZvcebeYmw78s8zUe+izItwra7Zlzmw
         chuvxGG8MfQJqvi/DAup5w9WTuqxYOBMxSWcIy2565rdoo/HRXfGxd94cdb55UBECQY2
         3osguEV7hDJdQP/ScXqPgtz1lLSmLUejmE9ngjUm39gmoM4VNXALnKthHjsHPyjVFqTR
         Kx1rfzd8XbiGrlnABISa3X5t0ykNOr+8cHjuQGO58y/ColfALrQELcq/YztvSUV0wkxa
         BDAVpK9qu2KDtw0kBzCtzGI3kH0ybO+rcXLJ9cS+xpvKZynQGRIbhIsN2G7eDWfmQAS5
         h63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782748252; x=1783353052;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cbT/MmV5kCCoKkbsAET+KqgtV+IxC0WLVD07qfPPpL4=;
        b=XqB81rgqmbY8HA9BjDXTzmNQP9cCSpqFKzcqTguqQqTTegZEIloE+Tqpid80TPQeR7
         vAB1KsgPSoKBx154wIt4cdHDhgIwlNXeqycE/JpXXRczV7uFHEdgHxQ9TKhdx2cnrxdf
         nVyslJJ60hV9dq00ykM35Dc9jHoMgbxww2ZLMM3I8erf3BcRj3wpm8sLRy8xOSN12yZW
         RCTT2+4V7dBACcScZyLjsB2pKneutEuC5kYpmsDICk1YrWxhuceflHNd8knuEwtcKDUt
         GWFTZ+ahlq9IGT3dmOhYcLvfzYtq4yHnmA1IB+m4jVkCu0gq6wGxUTYJj7xZVnO/Lnzu
         apKw==
X-Forwarded-Encrypted: i=1; AHgh+RraTm/3/apw2Z5pYTKP+AWFsmchos5UTZqukxGMGNhL8fz8b3LVOtgYYdXPtyEFcjllbLDA3yIUlW6GKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUcUj0lSVtWeBPnDiynYCMzujOEaoxaNOdb/89HrV3ZiEj4odb
	92Y5eRagAvaZ+LgXc96wdPiqGJNp3T3mI57dQ99fsdBpT2Rjo6g1x11hK9glOw==
X-Gm-Gg: AfdE7ckKWNDeQqZ8sMlvcfSJFmw1dEcT6nWBlwttNr5YNGjiXU1D0J+7nF7m5yWsUXn
	WjsgmrCrHBL9gd54797p6mzPB3xeui5FBW+MlstY1vg8BTf15cOd2jEooSeHNEJZ9kiXqOnhNCh
	vUzfdCwTpp6Nli9+IUzUNY/17nqBtb6vpoxrYT6xQXonfyzG6q4ZY4fHvaXQjQ0vEf9f3O8o82J
	umdBvRG2ej581m/H6dHWr26ZLc4MYKR8Wqs67/+DWu43Og6KQuj6V7irBqnTj5c2CbuvtGgoFhZ
	nf+i+vdJcAHF+maIcCeneDQcIeOoEE+JLUei+OuMk97Kxc9eZpsvftybniasQjo14DTl5Qa+EbW
	OgEot3VceyT2Q0boYoBlTA0W8caEaHR47emnnAYevu2fr+f0Za8ywxlOhlc7iwLQS/UuG6Ax91e
	prJlkT0pSKUJN5TKtn/OXd1hQpVg==
X-Received: by 2002:a05:7301:e8d:b0:30c:2af0:1cc with SMTP id 5a478bee46e88-30ee14c4090mr9167eec.34.1782748251705;
        Mon, 29 Jun 2026 08:50:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1ab6sm77427097eec.15.2026.06.29.08.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 08:50:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 29 Jun 2026 08:50:50 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Ashish Yadav <ashish.yadav@infineon.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/xdpe1a2g7b) Add regulator support
Message-ID: <c5ad7add-85b5-405e-b38d-b19d3e8d8a2e@roeck-us.net>
References: <20260619-xdpe1a2g7b-v1-1-428c3847be0d@nexthop.ai>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260619-xdpe1a2g7b-v1-1-428c3847be0d@nexthop.ai>

On Fri, Jun 19, 2026 at 11:44:57PM -0700, Abdurrahman Hussain wrote:
> Register both dual-loop output channels with the regulator framework by
> populating regulator_desc[] and num_regulators in pmbus_driver_info.
> This exposes the standard PMBus OPERATION-based on/off control and
> status reporting to consumer drivers.
> 
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Applied.

Thanks,
Guenter
