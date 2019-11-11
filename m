Return-Path: <SRS0=0ZqG=ZD=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6249FC43331
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Nov 2019 20:35:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 35ED6206A3
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Nov 2019 20:35:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=distech-controls.com header.i=@distech-controls.com header.b="K72rj1A2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727093AbfKKUf2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 11 Nov 2019 15:35:28 -0500
Received: from mx0a-002ab301.pphosted.com ([148.163.150.161]:7066 "EHLO
        mx0a-002ab301.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726877AbfKKUf2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 11 Nov 2019 15:35:28 -0500
Received: from pps.filterd (m0118789.ppops.net [127.0.0.1])
        by mx0a-002ab301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xABKUaTW013939;
        Mon, 11 Nov 2019 15:33:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=distech-controls.com; h=from : to :
 cc : subject : date : message-id; s=pps-02182019;
 bh=RSuQv3B5X8eZRcFRHj0snrAJMk64z50YXs+reroRNu4=;
 b=K72rj1A24Jjva5x+N9gqzBDVGjN9Fepbhz3YD5TvywfCdvk3HOre/fQmcf4RMkVVa+sE
 qxKXGQK1U0FWPKZKT/3C5OrDUR24Al61khrhsVwBVRz9QUsIXD8eOY8iWaPURFWsd753
 MSR4sGC9YX3Yt3ERpBckC/LW79sWaBdXw0wcIqeW7Z20r9/7sIFozpZbzqFUOK07cyq7
 +UZ097YXCpBKZW/4I2MEO+usYNPXjEVWq6wsH2+yMYLVHelgDH+Wg47/638A2qHDFdWZ
 drW8zWxg3MJyYpWHoyLmfNfvpKmvX/3zTcNBwKGIw5Erqtnh+UNqbyBz5R0eeId/HCSd lQ== 
Received: from pp-smtp-02.acuitylightinggroup.com ([170.76.205.10])
        by mx0a-002ab301.pphosted.com with ESMTP id 2w5q5c2h02-1;
        Mon, 11 Nov 2019 15:33:40 -0500
Received: from pps.filterd (pp-smtp-02.acuitylightinggroup.com [127.0.0.1])
        by pp-smtp-02.acuitylightinggroup.com (8.16.0.27/8.16.0.27) with SMTP id xABKWj6j021872;
        Mon, 11 Nov 2019 15:33:40 -0500
Received: from inf-dsk-207.acuitylightinggroup.com (inf-dsk-207.acuitylightinggroup.com [10.59.79.18])
        by pp-smtp-02.acuitylightinggroup.com with ESMTP id 2w5rqdr7yt-1;
        Mon, 11 Nov 2019 15:33:40 -0500
From:   etremblay@distech-controls.com
To:     linux@roeck-us.net, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com,
        corbet@lwn.net
Subject: [PATCH v7 0/2] hwmon: Add driver for Texas Instruments TMP512/513 sensor chips.
Date:   Mon, 11 Nov 2019 15:34:43 -0500
Message-Id: <20191111203445.27130-1-etremblay@distech-controls.com>
X-Mailer: git-send-email 2.17.1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-11-11_06:,,
 signatures=0
X-Proofpoint-Processed: True
X-Proofpoint-Spam-Details: rule=outbound_spam_notspam policy=outbound_spam score=0 suspectscore=0
 bulkscore=0 phishscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 spamscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1911110179
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Eric Tremblay <etremblay@distech-controls.com>

Version seven of the driver for Texas Instruments TMP512/513 sensors.

Thanks for the review

Main changes from version 6:
	- Add tmp513 to index.rst
	- Use microvolt instead of volt for bus voltage range
	- Fix current value interpretation
	- Wrap dt-bindings lines to 80 characters

Main changes from version 5:
	- Use shunt-resistor-micro-ohms standard property
	- Fix alignment between 'enum' and 'default' in dt-bindings

Main changes from version 4:
	- Remove config_lock mutex
	- Rewrite dt-bindings in yaml

Main changes from version 3:
	- Remove tmp51x_config structure, there was no useful static
	  field in the structure. The data was moved to tmp51x_data
	  structure.
	- Remove platform data
	- use device_ API instead of of_device API
	- Use array for n-Factor values.
	- Set shunt default value to 1000 uOhms

Main changes from version 2:
	- Remove the neccessity to provide a shunt-resistor value
	- Remove max-expected-current-ma configuration and always
	  use max possible current for calibration
	- Make sure calculation during calibration can't overflow
	- Add value clamping for DT value and runtime parameters
	- Support non DT system
	- Move hysteresis from DT to standard attribute

Main changes from version 1:
	- Use the with_info API instead of sysfs attributes.
	- Remove non-standard attributes and raw value.
	- Move settings that were non-standard attributes to
	  device tree, update documentation as well.
	- Fix coding style issues

Eric Tremblay (2):
  dt-bindings: hwmon: Add TMP512/513
  hwmon: Add driver for Texas Instruments TMP512/513 sensor chips.

 .../devicetree/bindings/hwmon/ti,tmp513.yaml  |  89 ++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/tmp513.rst                | 104 +++
 MAINTAINERS                                   |   7 +
 drivers/hwmon/Kconfig                         |  10 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/tmp513.c                        | 789 ++++++++++++++++++
 7 files changed, 1001 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml
 create mode 100644 Documentation/hwmon/tmp513.rst
 create mode 100644 drivers/hwmon/tmp513.c

-- 
2.17.1

