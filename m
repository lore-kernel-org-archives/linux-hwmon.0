Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-eopbgr710077.outbound.protection.outlook.com ([40.107.71.77]:4676
        "EHLO NAM05-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725958AbeKGFfK (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 7 Nov 2018 00:35:10 -0500
From: "Woods, Brian" <Brian.Woods@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "x86@kernel.org" <x86@kernel.org>,
        Clemens Ladisch <clemens@ladisch.de>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Helgaas <bhelgaas@google.com>,
        "Woods, Brian" <Brian.Woods@amd.com>, Pu Wen <puwen@hygon.cn>,
        Jia Zhang <qianyue.zj@alibaba-inc.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: [PATCH v2 0/4] Update DF/SMN access and k10temp for AMD F17h M30h
Date: Tue, 6 Nov 2018 20:08:11 +0000
Message-ID: <20181106200754.60722-1-brian.woods@amd.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Updates the data fabric/system management network code needed to get
k10temp working for M30h.  Since there are now processors which have
multiple roots per DF/SMN interface, there needs to some logic which
skips N-1 root complexes per DF/SMN interface.  This is because the root
complexes per interface are redundant (as far as DF/SMN goes).  These
changes shouldn't effect past processors and, for F17h M0Xh, the
mappings stay the same.

v1 -> v2:
  * patch 3 & 4: add M30_DF_F3 straight to pci_ids.h to reduce churn
  * patch 2:
    - update commit msg and comment to explain root selection further
    - move return if !misc_count under where misc_count is calculated

Brian Woods (4):
  k10temp: x86/amd_nb: consolidate shared device IDs
  x86/amd_nb: add support for newer PCI topologies
  x86/amd_nb: add PCI device IDs for F17h M30h
  hwmon: k10temp: add support for AMD F17h M30h CPUs

 arch/x86/kernel/amd_nb.c | 53 ++++++++++++++++++++++++++++++++++++++++----=
----
 drivers/hwmon/k10temp.c  | 10 ++-------
 include/linux/pci_ids.h  |  3 +++
 3 files changed, 50 insertions(+), 16 deletions(-)

--=20
2.11.0
