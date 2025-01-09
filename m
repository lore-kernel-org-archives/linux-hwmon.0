Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86C11FF5FB;
	Thu,  9 Jan 2025 20:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736455511; cv=none; b=rHRbp/fACVCc+JcIxVeNqhnsFn85NCX+RJiVXJo9KVFdP8UmdHepU+F+gn/40ViMX/L/xlnucrDugoMc042pxfpVFKIQOOTu5wOf9RKEjGIUNmtU4ZuPuNx2Ki85oiHcJK7FTB9Q829bk0FGl40UKLDDog0UNyJcTnyNrnj2Inc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736455511; c=relaxed/simple;
	bh=tIftAHfW20jmRadpHU7xXIJMVlVBk5+gFZCmB+g9WgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qcvjleamDMPXhZP8HW/NlWie1OtjJlw+V7bHcZSiPxhhRJygHzqJQs7hcZWwzWJe+irOvRX6ZBYSbo2dbZpcMRIE5xwVT6MAqzDikfW7td+AtrazRQM7AdbJCMb9JwBlGiO4GdOaTbUbSuWk6i9mu8Id6HwavHB2uJmYiuvHAlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PmwS4kVO; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PmwS4kVO"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21644aca3a0so28530855ad.3;
        Thu, 09 Jan 2025 12:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736455509; x=1737060309; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wAXZdldmYmii3+eUG2bPNbvgIFHp5TjKV0O7qwKpvIk=;
        b=PmwS4kVOMWLuYB5taKD+FcNbgeDZrITUqz5k8xgA4bTd09aINi1R4grCAzdeNzRoa+
         tgqVGV1gpgHFfS+z5wjyaNQjgMUUi7+44UR5T9fMqTLme8r2rWZznEgmtC5GUR8ZaNZs
         FI4NGx75OZ6bdRnbjMfita9edLiRlTQ7rixnlW2oYMKlMvQOwDQi7h3YSi6ZBZOH+tf6
         vtRalWWuwqPj7WzRIwEVQbmM9ETiqmvoo4SHLa1IZoDxGgKtCliYRIuZRjAjPGTk36oq
         DTgGHWywCO6jjeU/tIINxQsQsAbqqeUCge+s8QAKi/XvKD2NlFMA5e5tWDqauCWRhZUn
         171A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736455509; x=1737060309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wAXZdldmYmii3+eUG2bPNbvgIFHp5TjKV0O7qwKpvIk=;
        b=N/gAELa06yjynWyeEYK+Kj72GPvKB2LmCM2u0FErp/FVz5JyiR+NYIOf7oP8Khqp2K
         BDtQGTHcDhM6TOECfzlYDPhIzh64xJaR5gEyjYxO6WcAiVoK6nbTT2RJFZHvixrT4cIb
         ypAb+IawzdqpD4JJ0uaKvMaE2+cmJckLnUUklILFyJVxYgRNc/Qgn7k8YxOaYu02zoYZ
         T/u55oDo0HB03wpLYkteQMAHyt7zC4jiUsn3NiGCRqEHNpWfrwzilYkg0hfjIikNuDe0
         09PQrhNScgPrBs/gCA6Ql+9uXenqjuTpcYNUcugNIbcISMwZ4xFKIQMnU//q5qL7CKni
         hS1g==
X-Forwarded-Encrypted: i=1; AJvYcCUtNHt/UyLxUAKnpJiRYTJyKu7S8/0h7ToxidY/SUUYKSg4K9CARt4sFoDMvhw1inftKZCsLkMllJgsmvs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBkX7Z44aJ18LAA7uCWU1jmCD/tzM2WgXdsoXGta5Y2qhpdRSI
	BBM+6tY0HRk2qsUIUr4P448dUfOEpwMzUN8PxaUs3rtpRk2yA/w5
X-Gm-Gg: ASbGncvEMU72oOUWO6yDKM1sZiEfL48qmVQO2DbZyyE2znGdN1MGL0qZB1Y1Pb62tqs
	QBJBtpoEJl+6vcHv9smHUyHZG6el4hF4z0vaSNgu/CY+m2hVxkUkg1WpyspNklvgv5wSjZqmadP
	ZBdX7BmYUNJmBbfao9ysXxX6iUh02zQoDmpIf7QQJlSV+0yWkNbWZPTubY33yNSuCxzo9EjBB5u
	3FWlFi1PEtbdWWZTHSDBcp+ZXJWruy4minz6DduVkUBPfb9lrk/qpk2FPSmWMBj7qtThQ==
X-Google-Smtp-Source: AGHT+IHUt6ubB3ASzG+tUyOgqWJMNZiMKOQYzv5R0A1tFpl5nFRCCtm+xTpoiysSozE/zLnh9+wxEg==
X-Received: by 2002:a17:902:d48a:b0:216:4064:53ad with SMTP id d9443c01a7336-21a840109d2mr110721515ad.48.1736455508842;
        Thu, 09 Jan 2025 12:45:08 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f219f0dsm1966385ad.139.2025.01.09.12.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 12:45:08 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 9 Jan 2025 12:45:07 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Huisong Li <lihuisong@huawei.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	jdelvare@suse.com, liuyonglong@huawei.com, zhanjie9@hisilicon.com,
	zhenglifeng1@huawei.com
Subject: Re: [PATCH v3 2/2] hwmon: (acpi_power_meter) Fix update the power
 trip points on failure
Message-ID: <6cc85a7a-9e1d-4e2a-849e-6c3b81cd53e1@roeck-us.net>
References: <20250109081708.27366-1-lihuisong@huawei.com>
 <20250109081708.27366-3-lihuisong@huawei.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109081708.27366-3-lihuisong@huawei.com>

On Thu, Jan 09, 2025 at 04:17:08PM +0800, Huisong Li wrote:
> The power trip points maintained in local should not be updated when '_PTP'
> method fails to evaluate.
> 
> Signed-off-by: Huisong Li <lihuisong@huawei.com>

Applied.

Thanks,
Guenter
