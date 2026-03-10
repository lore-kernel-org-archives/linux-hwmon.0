Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C86A36897F
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Mar 2026 20:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773174986; cv=none; b=TtH5d4Y7PDy+5Q1Q7pGq1VSdhF1Bs746wKsQbaEkbi1vqfIl3/aZ2PQFA7KzLewq+fWK+yx+dDAi5YgZWZ2fo/LL1roiTOn9/KPSO3BNVdCNo6NBSzTdvfWPkP23Lh7qViJrRFuckJUg1JAYTBJem9WiOK471Nrn7/ftzMjrtTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773174986; c=relaxed/simple;
	bh=UxKU/c+6UtfxgiXtYB9CIvu6YNjRUy0H34f8efaNJiA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L364zRnds51xeyuyNG9o/tkqFvtnI1EGDGHnrKslmsdOr+z00XaIOhi9CJlk6fdxknHjr6eoeDPHqY6jF7DTRq5W9syiXHZNiT4RGTotNlcsizIhDziD85TZspbHysJwNIRrzCHDaer2bhOgcCsX6duRd1DObJ9UGU5ItfAwgjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ApFSVtlX; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ApFSVtlX"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4852fdb36a8so41307745e9.2
        for <linux-hwmon@vger.kernel.org>; Tue, 10 Mar 2026 13:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773174984; x=1773779784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YWC89SNBP14Ak3zMdsjrEcAqrqhx0MSOXRT5kJJSs2w=;
        b=ApFSVtlXYwA/qlgT4bALmslYxlxt8LNSYXM2xDUG7fhLpE4H2Rj/22Jr65FsbArQw+
         t9KPJSjeKJfytlDpbUl1D1BbKTRs1IGgZgULhI+O3KkHXIYFPD9CJwrqbD+osLJrx8Vp
         Sl83DPTceJPogiY4s0+kZ8kXBkBEkaJJ0U7VPNHzkFjxRQ02mPEBsMKzj9ewTB/icMQv
         A1Gqbpf23YEgvFkD+eDT7iwvOf2+Alp4+uSEfh9hXrBfuK3+IDt+eCuQCtmOnfd5JgR2
         DEe1IVimuFSiqnxOm4BodrKDGtik0HJIhYEXeYsBB6ZnES/rI6zofOvEiyDuAjpHed2l
         bUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773174984; x=1773779784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YWC89SNBP14Ak3zMdsjrEcAqrqhx0MSOXRT5kJJSs2w=;
        b=FTZ3Rehl6dp1AFY+kqeQ+ptb/Kj/HMLczdSQQNgBahujF6iArJq0KsVJwKDcHrylZ5
         sbNMp+CwZ7S1Cn2itYVqiifaginAxyFeWfkaSGI/t/AzqkDeIpp7542DfjdB4I6CgTLv
         jHTOfLb/wd23mbqvpPwecfoY6AkmIri+7AiYcaTNC5h4G7cWt/4ZCSEPBo5zIgPgi8Mi
         xl5SvrhLaRCAJx4mMo0o1Z2pwfCSkAzLJ0bM9extaJMvpCHL9PZo6WtS7JoYZ+vYe8Bf
         CosfIvNN58GlSchSFXF0nKp1TUqgXDWS+4FE/YL/mHflQ8qT18u719xP8FCX2yAb4vtC
         M7XA==
X-Gm-Message-State: AOJu0YwGHSxTUoBLI2r10yZGP+HZkVtE6IcCREMdTEU6750uwh0R1pw9
	XHbRHkfbrpphNGmNQOOuMpFqDn8EElGZ3Iti9I5N8oIYPH1MLxW40DSx
X-Gm-Gg: ATEYQzwKPLVPuKXH8cqIZm0I4yXCxPeb05OMZURKwgnO2uWr22pqNdCVfs4PgzblSV9
	dHMGoSbv//lwmJt+dhjMi3JVO2Q6zhstNYn6nBGkAmOcfy2owdt8RUdyHPALXqRitBniaXTMvTK
	IfHVf96ZYR0irnZOC5mbrnKJo8zRHClrLH9/kOCAYY6ZC27fXi8pVfISWkL8Qs7Ktn/tudx+ctN
	k+wl5SKyijvr9OAzDHGdy508DLb8gErdWUA4f78NH4kSINnrlmpEP67m/uo3Ma96J56lKfryp8K
	L2ow69q2T7oMBMRBEU+gtug7261zwJZ/JoDTO0s6nMb7zxViG3Zy1hCngaCjqXAqPagDO56Zf9d
	/YHxNhb0p6N78O/4XIQeo9gN0E60GUbRf5vBC+Krarf8TCGduUQzv+6+2+iGf5F67H6ANpOhlp/
	WGtvPGneDOBhRu921l2C/R8tHlCA==
X-Received: by 2002:a05:600c:314d:b0:480:1d0b:2d32 with SMTP id 5b1f17b1804b1-4854b0e8111mr2819035e9.12.1773174983720;
        Tue, 10 Mar 2026 13:36:23 -0700 (PDT)
Received: from localhost ([37.228.227.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b7f3cdsm117372275e9.14.2026.03.10.13.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:36:23 -0700 (PDT)
From: Jaime Saguillo Revilla <jaime.saguillo@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jaime Saguillo Revilla <jaime.saguillo@gmail.com>
Subject: [PATCH] hwmon: ibmpex: check ibmpex_send_message() return value
Date: Tue, 10 Mar 2026 20:35:55 +0000
Message-Id: <20260310203555.33896-1-jaime.saguillo@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several ibmpex request helpers ignore the return value of
ibmpex_send_message() and then unconditionally wait for
read_complete.

If transmit fails, no response will arrive and the code may wait
indefinitely. Check ibmpex_send_message() return values and
propagate errors to callers instead of continuing.

Also propagate reset command failures through
ibmpex_high_low_store().

Signed-off-by: Jaime Saguillo Revilla <jaime.saguillo@gmail.com>
---
 drivers/hwmon/ibmpex.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/ibmpex.c b/drivers/hwmon/ibmpex.c
index dec730798d58..92cda205e57c 100644
--- a/drivers/hwmon/ibmpex.c
+++ b/drivers/hwmon/ibmpex.c
@@ -133,9 +133,13 @@ static int ibmpex_send_message(struct ibmpex_bmc_data *data)
 
 static int ibmpex_ver_check(struct ibmpex_bmc_data *data)
 {
+	int err;
+
 	data->tx_msg_data[0] = PEX_GET_VERSION;
 	data->tx_message.data_len = 1;
-	ibmpex_send_message(data);
+	err = ibmpex_send_message(data);
+	if (err)
+		return err;
 
 	wait_for_completion(&data->read_complete);
 
@@ -159,9 +163,13 @@ static int ibmpex_ver_check(struct ibmpex_bmc_data *data)
 
 static int ibmpex_query_sensor_count(struct ibmpex_bmc_data *data)
 {
+	int err;
+
 	data->tx_msg_data[0] = PEX_GET_SENSOR_COUNT;
 	data->tx_message.data_len = 1;
-	ibmpex_send_message(data);
+	err = ibmpex_send_message(data);
+	if (err)
+		return err;
 
 	wait_for_completion(&data->read_complete);
 
@@ -173,10 +181,14 @@ static int ibmpex_query_sensor_count(struct ibmpex_bmc_data *data)
 
 static int ibmpex_query_sensor_name(struct ibmpex_bmc_data *data, int sensor)
 {
+	int err;
+
 	data->tx_msg_data[0] = PEX_GET_SENSOR_NAME;
 	data->tx_msg_data[1] = sensor;
 	data->tx_message.data_len = 2;
-	ibmpex_send_message(data);
+	err = ibmpex_send_message(data);
+	if (err)
+		return err;
 
 	wait_for_completion(&data->read_complete);
 
@@ -188,10 +200,14 @@ static int ibmpex_query_sensor_name(struct ibmpex_bmc_data *data, int sensor)
 
 static int ibmpex_query_sensor_data(struct ibmpex_bmc_data *data, int sensor)
 {
+	int err;
+
 	data->tx_msg_data[0] = PEX_GET_SENSOR_DATA;
 	data->tx_msg_data[1] = sensor;
 	data->tx_message.data_len = 2;
-	ibmpex_send_message(data);
+	err = ibmpex_send_message(data);
+	if (err)
+		return err;
 
 	wait_for_completion(&data->read_complete);
 
@@ -206,9 +222,13 @@ static int ibmpex_query_sensor_data(struct ibmpex_bmc_data *data, int sensor)
 
 static int ibmpex_reset_high_low_data(struct ibmpex_bmc_data *data)
 {
+	int err;
+
 	data->tx_msg_data[0] = PEX_RESET_HIGH_LOW;
 	data->tx_message.data_len = 1;
-	ibmpex_send_message(data);
+	err = ibmpex_send_message(data);
+	if (err)
+		return err;
 
 	wait_for_completion(&data->read_complete);
 
@@ -276,8 +296,11 @@ static ssize_t ibmpex_high_low_store(struct device *dev,
 				     const char *buf, size_t count)
 {
 	struct ibmpex_bmc_data *data = dev_get_drvdata(dev);
+	int err;
 
-	ibmpex_reset_high_low_data(data);
+	err = ibmpex_reset_high_low_data(data);
+	if (err)
+		return err;
 
 	return count;
 }
-- 
2.34.1

