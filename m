Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C8F127B73
	for <linux-hwmon@vger.kernel.org>; Fri, 10 May 2024 14:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715349614; cv=none; b=dNEVtqHuMd7kIzU60vj3gyMhqtoXwfRZkll2usGluqW7tbRieGwuhVDb3ggq2/T6JECLa+XTZrngtQlH+lKAQ5oftR0ghDql8d02aML//n5Ez1fVxoXiWtmMuju8qsxOCifSUVY8ma8Pksi6sC9GpR2PhPwyImIBAe1PJRqbqKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715349614; c=relaxed/simple;
	bh=kdDp8KIWJJWZVJzngteV0lA0nzLqJbBl3aaTr46lgPo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uzmF1aMql6D1bQ8EV+Zvf3g7b+gztkb5N+2pQaFNg+EUJyncKlUCDRfdzJbGDy5+3/GG/zNm9mBMSUbgbae/jXGnKaPfMg011H+r0egO7m5Ch6vM5ALVhRF72cT8AXuaVV8yeVC6B5H5S6SMbeG/b5MIRVq0g506r3bQEramlEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kF76RJGb; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kF76RJGb"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a5a157a1cd1so516985666b.0
        for <linux-hwmon@vger.kernel.org>; Fri, 10 May 2024 07:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715349611; x=1715954411; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4ZlrmJ08xn9rS8WeTH0BsmLJblOAl7nAHbwgAShhEd0=;
        b=kF76RJGbZDwgZOzgNrCq6iczQP/+TpZRPlHOV7gJiTzuypcx/eTWz3B2PqrnuYCTjP
         RyyBOLW9cHc54qUEcQwVUbnihlJxQjWizFLaJEGHVJd7W6tBbALdApS19k3ybq9Ge/T7
         nMlZY7rP8kar3J8RYVTiySS5YJNKzcRnKD2DUd84MSyvHkyM3BA88KQ2wmNIWemN+8eA
         QsWzcYnogrVGYBj2mmIJiqypv1UnhMOubUVY0lNrsGAJQUHMtDT8/Gicv6pUknG7NNby
         C+msa10oq8pdg6Ag3o/1W1UkM0e+aIrrMtANUcNHmWTrFHuiQyT+3M7mCLFC1EnlpLre
         ay6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715349611; x=1715954411;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4ZlrmJ08xn9rS8WeTH0BsmLJblOAl7nAHbwgAShhEd0=;
        b=M28oNb6p1eehkGTMEVqsWzwpvyEAljzZSBrplFxOsh1siUDgFrgMZeGnSh0qgfOoCE
         SI/vmMBLY/c9+WcC0y+Bj/Ra21+bDcivTUSTvzU+zA7PdEWyz1xrNTzlCAILwXlOHN2F
         DprZvdJFvi9dOgITxJyIuJEDZqNVaTHs5OMxRgfY1r6/d52mVUomJLCfmId4fwVsnB16
         W/GjT/pf7g1vqIp48g4T38tmX6UFtj3s8Yt4S9Vl7WWubnUpeUmtZpjOnN413MsrsY9v
         2L8Oi/k/t6EQZzsEyeSg5CzGCpc/AtQtbRVb9OsID/d0yXO7YYfYiTaWiN/jPFtDT9l1
         lftA==
X-Gm-Message-State: AOJu0Yxi7m3pDrCoIdTHyWgDRjMj3R9AMn4c3IzYGbtxNr795HYr2MLt
	6WfV5ImoJ2CQaGNbWa8N7uuD+O5rGG/7gHBlpy6r8t9NIcMcKVATepAUAfK9eZVk3p5v9HXh/Jr
	g
X-Google-Smtp-Source: AGHT+IEzLqnCGYgsKA393227ouqeOh+KLSelLAV+I28Pm3GybyHBFZP2FWTehLW55uGWduSeyRUY+A==
X-Received: by 2002:a17:907:3208:b0:a5a:1562:5187 with SMTP id a640c23a62f3a-a5a2d66a3a4mr215281966b.55.1715349610416;
        Fri, 10 May 2024 07:00:10 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1781cd90sm187248266b.20.2024.05.10.07.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 07:00:09 -0700 (PDT)
Date: Fri, 10 May 2024 17:00:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: savicaleksa83@gmail.com
Cc: linux-hwmon@vger.kernel.org
Subject: [bug report] hwmon: (nzxt-kraken3) Decouple device names from kinds
Message-ID: <b1738c50-db42-40f0-a899-9c027c131ffb@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Aleksa Savic,

Commit 346e147a91f2 ("hwmon: (nzxt-kraken3) Decouple device names
from kinds") from Apr 28, 2024 (linux-next), leads to the following
Smatch static checker warning:

	drivers/hwmon/nzxt-kraken3.c:957 kraken3_probe()
	error: uninitialized symbol 'device_name'.

drivers/hwmon/nzxt-kraken3.c
    873 static int kraken3_probe(struct hid_device *hdev, const struct hid_device_id *id)
    874 {
    875         struct kraken3_data *priv;
    876         const char *device_name;
    877         int ret;
    878 
    879         priv = devm_kzalloc(&hdev->dev, sizeof(*priv), GFP_KERNEL);
    880         if (!priv)
    881                 return -ENOMEM;
    882 
    883         priv->hdev = hdev;
    884         hid_set_drvdata(hdev, priv);
    885 
    886         /*
    887          * Initialize ->updated to STATUS_VALIDITY seconds in the past, making
    888          * the initial empty data invalid for kraken3_read without the need for
    889          * a special case there.
    890          */
    891         priv->updated = jiffies - msecs_to_jiffies(STATUS_VALIDITY);
    892 
    893         ret = hid_parse(hdev);
    894         if (ret) {
    895                 hid_err(hdev, "hid parse failed with %d\n", ret);
    896                 return ret;
    897         }
    898 
    899         /* Enable hidraw so existing user-space tools can continue to work */
    900         ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
    901         if (ret) {
    902                 hid_err(hdev, "hid hw start failed with %d\n", ret);
    903                 return ret;
    904         }
    905 
    906         ret = hid_hw_open(hdev);
    907         if (ret) {
    908                 hid_err(hdev, "hid hw open failed with %d\n", ret);
    909                 goto fail_and_stop;
    910         }
    911 
    912         switch (hdev->product) {
    913         case USB_PRODUCT_ID_X53:
    914         case USB_PRODUCT_ID_X53_SECOND:
    915                 priv->kind = X53;
    916                 device_name = "x53";
    917                 break;
    918         case USB_PRODUCT_ID_Z53:
    919                 priv->kind = Z53;
    920                 device_name = "z53";
    921                 break;
    922         case USB_PRODUCT_ID_KRAKEN2023:
    923                 priv->kind = KRAKEN2023;
    924                 device_name = "kraken2023";
    925                 break;
    926         case USB_PRODUCT_ID_KRAKEN2023_ELITE:
    927                 priv->kind = KRAKEN2023;
    928                 device_name = "kraken2023elite";
    929                 break;
    930         default:
    931                 break;

device_name is uninitialized on this path.  Probably just error out
here?

    932         }
    933 
    934         priv->buffer = devm_kzalloc(&hdev->dev, MAX_REPORT_LENGTH, GFP_KERNEL);
    935         if (!priv->buffer) {
    936                 ret = -ENOMEM;
    937                 goto fail_and_close;
    938         }
    939 
    940         mutex_init(&priv->buffer_lock);
    941         mutex_init(&priv->z53_status_request_lock);
    942         init_completion(&priv->fw_version_processed);
    943         init_completion(&priv->status_report_processed);
    944         spin_lock_init(&priv->status_completion_lock);
    945 
    946         hid_device_io_start(hdev);
    947         ret = kraken3_init_device(hdev);
    948         if (ret < 0) {
    949                 hid_err(hdev, "device init failed with %d\n", ret);
    950                 goto fail_and_close;
    951         }
    952 
    953         ret = kraken3_get_fw_ver(hdev);
    954         if (ret < 0)
    955                 hid_warn(hdev, "fw version request failed with %d\n", ret);
    956 
--> 957         priv->hwmon_dev = hwmon_device_register_with_info(&hdev->dev, device_name, priv,
                                                                              ^^^^^^^^^^^

    958                                                           &kraken3_chip_info, kraken3_groups);
    959         if (IS_ERR(priv->hwmon_dev)) {
    960                 ret = PTR_ERR(priv->hwmon_dev);
    961                 hid_err(hdev, "hwmon registration failed with %d\n", ret);
    962                 goto fail_and_close;
    963         }
    964 
    965         kraken3_debugfs_init(priv, device_name);
    966 
    967         return 0;
    968 
    969 fail_and_close:
    970         hid_hw_close(hdev);
    971 fail_and_stop:
    972         hid_hw_stop(hdev);
    973         return ret;
    974 }

regards,
dan carpenter
