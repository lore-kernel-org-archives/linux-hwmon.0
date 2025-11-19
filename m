Received: from puck.nether.net (puck.nether.net [204.42.254.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701F5372AA1
	for <linux-hwmon@vger.kernel.org>; Wed, 19 Nov 2025 23:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=204.42.254.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763596038; cv=none; b=ADzHZcnyomao9xt7AvBoNwBLLM8W2MDYERJQeRITUsDdCv2l+YwMe0IPbNc95K89dRbSzifQySXlt28rG/3nT2w4BuyRbrUqvNqAE9EkQsGoZZNS7D0fP8pJSl2xJEwtZMNZxlI106213/4b3kgCYlynxEtCowuDh1A8sgo6mSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763596038; c=relaxed/simple;
	bh=jxEtVQ+rPOOeHlK2K5sanqb9AVrkknDWlx5gfMOymF4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rUd1SdEtQ7iZVKOHm8r7Ipeuq7tKocSLOuyUVYLQsb+zkk925q1DxdIVg2OKhkmvwIxSiKFhYchGysVYwlRJbwwdW/oXxfemxId/cm+w9ITERnK9HDGpeD3UkqpS63WpjxVKpq3z3oakmELj7pZEXoU/O6D0LDtlc0hQAP7OrEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=puck.nether.net; spf=pass smtp.mailfrom=puck.nether.net; dkim=pass (2048-bit key) header.d=puck.nether.net header.i=@puck.nether.net header.b=GwUc+VbL; arc=none smtp.client-ip=204.42.254.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=puck.nether.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=puck.nether.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=puck.nether.net header.i=@puck.nether.net header.b="GwUc+VbL"
Received: by puck.nether.net (Postfix, from userid 162)
	id AA4CA540220; Wed, 19 Nov 2025 18:46:32 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 puck.nether.net AA4CA540220
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puck.nether.net;
	s=default; t=1763595992;
	bh=jxEtVQ+rPOOeHlK2K5sanqb9AVrkknDWlx5gfMOymF4=;
	h=Date:From:To:Cc:Subject:From;
	b=GwUc+VbLLD0BzExA5B20blYPtOIO7VfHJmQHyNrIGWz9NWno7cOJHKhQKsfaTIevx
	 OlEal+vATPxYy9QmAnhIxZREaesiqltIj6PrP684OqbqYUtkzlzWgsaXWte4KCaPmM
	 3bDjGy7Qz5wFAR7N6V6ief+fXE/pLT/BX4iEEM/sKnaj3zIq8Tu77OXEf3E9wTg8fj
	 vxUwsbkVtphQqdORBxCdC9bhKMHQ9EZhaM598kzv+ZaSEGee5KIzEUHEk/Pe3VPUP8
	 zGQEcr+2A2oefbhKVxTdCj9W3MczaPJ/LJr14VAzDcpLaFIm0NFnU6P7TE2g+5stWF
	 xsrOSUo8FBm+g==
Date: Wed, 19 Nov 2025 18:46:32 -0500
From: Jared Mauch <jared@puck.nether.net>
To: rydberg@bitmath.org
Cc: linux-hwmon@vger.kernel.org
Subject: Patch: applesmc.c - update handling
Message-ID: <aR5W2K2Ic06uPgBy@puck.nether.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="Efecm1Qj/A2It8yk"
Content-Disposition: inline


--Efecm1Qj/A2It8yk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Updates code from hwmon_device_register to hwmon_device_register_with_info

Signed-off-by: Jared Mauch <jared@puck.nether.net>

diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
index fc6d6a9053ce..984dfbf40233 100644
--- a/drivers/hwmon/applesmc.c
+++ b/drivers/hwmon/applesmc.c
@@ -1362,7 +1362,7 @@ static int __init applesmc_init(void)
 	if (ret)
 		goto out_light_sysfs;
 
-	hwmon_dev = hwmon_device_register(&pdev->dev);
+	hwmon_dev = hwmon_device_register_with_info(&pdev->dev, "applesmc", NULL, NULL, NULL);
 	if (IS_ERR(hwmon_dev)) {
 		ret = PTR_ERR(hwmon_dev);
 		goto out_light_ledclass;



--Efecm1Qj/A2It8yk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=applesmc.c.patch

diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
index fc6d6a9053ce..984dfbf40233 100644
--- a/drivers/hwmon/applesmc.c
+++ b/drivers/hwmon/applesmc.c
@@ -1362,7 +1362,7 @@ static int __init applesmc_init(void)
 	if (ret)
 		goto out_light_sysfs;
 
-	hwmon_dev = hwmon_device_register(&pdev->dev);
+	hwmon_dev = hwmon_device_register_with_info(&pdev->dev, "applesmc", NULL, NULL, NULL);
 	if (IS_ERR(hwmon_dev)) {
 		ret = PTR_ERR(hwmon_dev);
 		goto out_light_ledclass;

--Efecm1Qj/A2It8yk--
