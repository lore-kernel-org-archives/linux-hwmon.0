Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36EB451981
	for <linux-hwmon@vger.kernel.org>; Fri, 11 Sep 2026 21:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789162647; cv=none; b=nb5CsRKCdOnNGeyCcouYcCElDW8CjnweaQIPiyBT4+SQU9EFCZ3249JrjNFYmUYmoCcNF7R1UryRSY4J6iS3wFPy4IWoGEcBcTCDnW9FGY057WposFf8MQqu+hTfMiU6eeH7CkhCNMlD4SusQhm3oCHDLmsjEIv1P0N8WXPGHLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789162647; c=relaxed/simple;
	bh=6gfZK/r3jRpcJkDtpDfh8FHtMgfEXUaVAq/Po63FKik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H23D76ICuyMOkxhreAqiagn+DsNGZbIEk9KdqaENM0wS2tFcm9ZQXxIRciXhmioeqKSkmVTZmvXblrnidIAgY0WeJBgDW5lr3hD4BNCQEGXdgKCbWPtBmL+V6rgSHN+xdGclzNd9HekBI4iMsi8MfRjr34VSCtb6TEEcIbwcrRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gJvJVwxk; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gJvJVwxk"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-86265451beeso925807b3a.0
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Sep 2026 14:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789162645; x=1789767445; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9sK4Nf/d2+ZKbGxGlDotG105Mai4PaehwRMmBT9ZKz8=;
        b=gJvJVwxk5eneGVCROQ5B+LqrBjnvWTG4xm9vgKRs2eQzY8gDD9/krEaWpdjQIWlErV
         6RCz0vWEzT6J+HK1gOABROUZkBUDRDS0do5lxxeeHn+CyDnE17pkS6zAvIFQNOWA4UyB
         cPyGl6lvfICQze8MnGJeh/84y4sX5sk3xkI94OAkg+T/6o2y+JXkRCdjpeEQUCCF1DGu
         0Q7VZ6A+0fGIWwz5bKaWfVLNcPXabsI4hk6ctRU6v1CF6U5skW4AlSbJDUevov6DM2BG
         /Y0y9D8TXwWmAOEI1GB7gvkkcKxa5IwL6Gr/qumWYf1D7SFdrfgikt6h/tjY/+vjA59r
         dZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789162645; x=1789767445;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9sK4Nf/d2+ZKbGxGlDotG105Mai4PaehwRMmBT9ZKz8=;
        b=p8M1CeQ2bLOPIY9c1UidqaWEhKm0PPeb2++MBOpapIgpdBJtNHxPAPdZ0C8pbnRY6H
         GgQzAFSbPu4bxFTiR8VVUA5zEjroup1NQx4yGVy69GexKI1OpD6aiJDE8hl34+ZMU06S
         hqW7Bd4/Tb/XcPpT9vrvtUuLfAwz8b2An7GzjgPsKNPH0/CawqfK3pfGuQr26NwDsws2
         WqGu2EVEJe3vfzCbvYiBoncpplsRYZuaQQepRWX3Ej2IcpRFH8yf49NDZXSoSWwm5Elt
         QyUFkciuPFuYnTfV8V3ZED7Yaf2UFU/qqoL8kVM2lSwkaIdER3Lj7Jyba7CT/BgY0OhX
         qLvg==
X-Forwarded-Encrypted: i=1; AKwUvBwHro0C6gx1JQomUQ9rWmawaU9Cr6YIvtL8h9ZCl8cH2RghbKqOJ4bnZtXsrmmHHFq4V/7TEjX9aUfWyQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nHbehMM7TcihC/qAdKPAJu3R/FOa+WjNXv69GJfh3oPVYvkK7F
	a2cnWTpOjjyLJ9AY4g9CH2RdOaGtqGo/tNps+dAalJ1KJ/D5cfjOm3rU
X-Gm-Gg: AYBFou3UPnbdyo+TIe3WQzDjJg8gOgaMKxfDksg5b4gtxZV0x3YuW7oO7YfUHrHDnKV
	RuzZkWCD1FU5vqei/8Mh2CDwT0WwmTrf4CD+tVVvMmAWaxRLGZYpVA8VkKYB7biuvnVpqE9L9wQ
	Y3qg1phinykVD+OqsukqPx0QFGvDwlYfsuyb5pFJR+0K/lumGkszKLy3PVkqc/zWGrgMnHgwaLG
	j2+eJqGySttOuDZffKdq04uWBpdVbRMhaXM8REuifZbblB17BLAZRRFCNIjHP9cav8tw6flb1mu
	uiw6rwEpEXLgNjnz4EWX0AUcSM4gTx0NCulj3H05kDqYIGprQGVzbJIliEH9FC6bZz2qk+zJ9VH
	5YP3s7NxE/axiOMAtmXU5wCB/Z1cFsALXkpNDl7ToKBbfjueIZvyku6jk/1ucos3riUf5mJhfiz
	aF+JMFl7YURMDbh7mdA7GjJBhvmUUWY0LRJ8eMZhEeM9Nuj74O6QP/1laiP//XnPm2uNQEuzkwT
	UKB5fnB74AXhGy0a1vbphc=
X-Received: by 2002:a05:6a00:18a9:b0:862:bb07:2b97 with SMTP id d2e1a72fcca58-86b2fb17ef7mr8478943b3a.13.1789162644855;
        Fri, 11 Sep 2026 14:37:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b6139e3bfsm1486203b3a.50.2026.09.11.14.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 14:37:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 11 Sep 2026 14:37:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: bhelgaas@google.com, clemens@ladisch.de, linux-hwmon@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 1/2] hwmon: (k10temp): Add support for 1ah/80h
Message-ID: <6d216040-a03b-4606-b1c0-7c9b780cd6d1@roeck-us.net>
References: <20260911191803.1522358-1-mario.limonciello@amd.com>
 <20260911191803.1522358-2-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911191803.1522358-2-mario.limonciello@amd.com>

On Fri, Sep 11, 2026 at 02:17:13PM -0500, Mario Limonciello wrote:
> 1ah/80h uses same base as other programs.  It only supports Tctl.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Applied.

Thanks,
Guenter

> ---
> v2:
>  * Move header to k10temp.c
> ---
>  drivers/hwmon/k10temp.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
> index 3e7e63edc6a30..5414b7841864b 100644
> --- a/drivers/hwmon/k10temp.c
> +++ b/drivers/hwmon/k10temp.c
> @@ -94,6 +94,7 @@ MODULE_PARM_DESC(force, "force loading on processors with erratum 319");
>   * Defining locally as IDs are not shared.
>   */
>  #define PCI_DEVICE_ID_AMD_1AH_M50H_DF_F3	0x12cb
> +#define PCI_DEVICE_ID_AMD_1AH_M80H_DF_F3	0x1243
>  #define PCI_DEVICE_ID_AMD_1AH_M90H_DF_F3	0x127b
>  
>  struct k10temp_data {
> @@ -582,6 +583,7 @@ static const struct pci_device_id k10temp_id_table[] = {
>  	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_1AH_M50H_DF_F3) },
>  	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_1AH_M60H_DF_F3) },
>  	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_1AH_M70H_DF_F3) },
> +	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_1AH_M80H_DF_F3) },
>  	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_1AH_M90H_DF_F3) },
>  	{ PCI_VDEVICE(HYGON, PCI_DEVICE_ID_AMD_17H_DF_F3) },
>  	{}
