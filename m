Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587A9295DBD
	for <linux-hwmon@vger.kernel.org>; Fri,  5 Dec 2025 04:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764907661; cv=none; b=uRtpbBMGFBirhvLm81FrJUrMKWJVVWtj/N4//wl9f4PQgtRi2UdcC96dFsj7oRrpQAo1SOBngpjekunYhsxzaE0MRXSYocFBS1OpR+3oalsHQI5VKOxJo3/OhdYHsDm+MEYcMGgz9tB4n2YN+PBE6skJvokPSLsA/739p0m7jDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764907661; c=relaxed/simple;
	bh=GoTkQEmQ87c+TKHzFtJYVQTfYhbJc6ei2uXpbgTjbAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qR4i3Hr8hJ8l5LF6R/NNmBQ/cphC/aS8qGi4dSvJx9a52ePsZWbefjsul3TfkvwHIYS2UICuESLFzBhDXwrORpZ6r2+UHPoJaP7ROGeum2dIaKFMB3kL/ulmZmQJ/YzTfHfou3BDaeqRYhmTYMCiHOWGFXS/KVmA76NYtd2gdo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FhBhANML; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FhBhANML"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-bde0f62464cso1442114a12.2
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Dec 2025 20:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764907659; x=1765512459; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5E+3W2p4iCEB+kvKZepz6omX7n0CtyBmUjmFJp0w+HU=;
        b=FhBhANMLzuXLMH0j6y3xTrNGFK3y/n1n3ej4pVWiyfRnji194Pv7QsVEN7Qo/JS5DS
         SoxgRXPeK0GZ6TdxwY0wVsT8atwfvRfnC7MDMXh+6qfS8WevQKQlV7OGJnRFY3z1qVrM
         5Om5XlMurQzM0FLLSwdbyyIPdZJOe5DubnrmHOS44xWkrsaNn/xuIGCrPR7npKYTFlfB
         QJ9PSYeuAp2iUXSJvP93s2itzFaZwbTdNlRbu0Mj7Qa6Brenb4avZ1M8YPTx2xF/Y5l1
         tcHOobLacl3Eq+gvrjyeuY+d8/bIBlIF1CZxsrEYobJ+nKMgBQSkAOrjTp4997rHigMe
         Nvdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764907659; x=1765512459;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5E+3W2p4iCEB+kvKZepz6omX7n0CtyBmUjmFJp0w+HU=;
        b=WcEqwNHrOieMrfqnj/El1kLz09gWWxlBttysN81yvfvdyH742r7VOtmSVrCRF19lZS
         VevtrGnL79kECgU/epV+W2zO2+5ykX5qdp4DyflE/AHhKmKXK6ZUVQmTI4NurQRUH6LT
         dvDCNAMybZJp2Wdxiq+MDJa4hYK2jpVnn/q1gtnadoa+cLGSS1TCm76WsPXz3Hb+WyZb
         uRbJkZrXPPs3VtdoHQsXWcb1haRGe8KZ41LR7SknXW20GQbZsBhUy6CnHamWDwvq7ECg
         IbBdGJ2NBMkjqmVK0joDv/t8DytF1qSJ3cDLNNBuyKJ7J2pWxp/D/YTWiH6Fh8yO4KVr
         bwpg==
X-Gm-Message-State: AOJu0YzYI1HJFB+qosvG28C6nSd9K5sQQNCF3P+d1mvFNXYgsRPswZo7
	+HIcAqffTs44bcHqviYnANtWA9hK6/arXhRffPrviPxEgshp+bOfoVGOwfzRGw==
X-Gm-Gg: ASbGncsT3ycMTCOPRYjc+jZ6Ez8dP1ubFD78qATrcq+74Wr3qrRSkZoTpV1aJSrkssR
	rCLtElTCCc+4aVJL731yzZRWME5DKDfcf7i1gWa+MqfoVVDW1aE5Flk2kdvj51TMfSJL1QNolNf
	Zff46IFzat0Qiqu/nhF4x+0yfxwvikJUXp3hQ0dnrQr8ky3jI5mqQ0JMo0KPTqAIEdIFcup0j9l
	W5EJWfxI4HbcPDmOATBWGCAhT5uY6Vxj5ADKoC4Wqjq+o6Zuzb9kFFhfKBAQbfL45Ae+gRHkjt5
	ZVslITrkDiG9bpoeut7aQgEGCdbeW6UPfRhU+t/c2N4Uas9bgrSmPX1o93PUyWQQknAGz73WSVk
	Aule6q8h5rw8kF8z30db83xsQh/2jBdd32r++U1MYAEtEFpoPpsVGmsfABwc2B3t5VVKykgDOAz
	5TGRxW6dwXPhdNc8pBG1vlIYmD5D3dKZs2xg==
X-Google-Smtp-Source: AGHT+IHsx8U/69TxJUx2on1/Bf73SMUIyuhNuhiR03Cc7iGe8dniosjlj1NbHCBSZuF6BawEoOuruQ==
X-Received: by 2002:a05:7301:4706:b0:2a4:3594:d535 with SMTP id 5a478bee46e88-2ab92d5454bmr4645290eec.2.1764907659420;
        Thu, 04 Dec 2025 20:07:39 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba87aa5fcsm9561666eec.3.2025.12.04.20.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 20:07:38 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 4 Dec 2025 20:07:37 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: xiaopeitux@foxmail.com
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	florin.leotescu@nxp.com, Pei Xiao <xiaopei01@kylinos.cn>
Subject: Re: [PATCH] hwmon: (emc2305): fix device node refcount leak in error
 path
Message-ID: <224d92ed-17cf-46d1-90f4-7b9dd0407cb1@roeck-us.net>
References: <tencent_5CDC08544C901D5ECA270573D5AEE3117108@qq.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_5CDC08544C901D5ECA270573D5AEE3117108@qq.com>

On Fri, Dec 05, 2025 at 11:15:13AM +0800, xiaopeitux@foxmail.com wrote:
> From: Pei Xiao <xiaopei01@kylinos.cn>
> 
> The for_each_child_of_node() macro automatically manages device node
> reference counts during normal iteration. However, when breaking out
> of the loop early with return, the current iteration's node is not
> automatically released, leading to a reference count leak.
> 
> Fix this by adding of_node_put(child) before returning from the loop
> when emc2305_set_single_tz() fails.
> 
> This issue could lead to memory leaks over multiple probe cycles.
> 
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>

Applied.

Thanks,
Guenter
