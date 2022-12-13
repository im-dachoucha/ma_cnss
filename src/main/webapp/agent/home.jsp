<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Medical files -agent-</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
</head>
<body class="">
<div
        class="grid h-[100vh] grid-cols-12"
        style="grid-template-rows: 4rem 1fr"
>
    <jsp:include page="inc/Navbar.jsp"/>
    <jsp:include page="inc/Sidebar.jsp"/>
    <div class="col-span-11 lg:col-span-10">
        <div class="bg-white p-8 rounded-md w-full">
            <div class=" flex items-center justify-between pb-6">
                <div>
                    <h2 class="text-gray-600 text-2xl font-semibold" id="title">Medical files</h2>
                </div>
                <div class="flex items-center justify-end">
                    <div class=" space-x-8">
                        <button class="bg-[#1D4584] px-4 py-2 rounded-md text-white font-semibold tracking-wide cursor-pointer"
                                id="new">New medical file
                        </button>
                    </div>
                </div>
            </div>
            <div>
                <div
                        class="hidden -mx-4 sm:-mx-8 px-4 sm:px-8 py-4 overflow-x-auto"
                        id="add"
                >
                    <form class="w-full" action="${pageContext.request.contextPath}/medical_file/add"
                          method="post">
                        <div class="flex flex-wrap -mx-3 mb-6">
                            <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0">
                                <label
                                        class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2"
                                        for="patient"
                                >
                                    Patient
                                </label>
                                <input
                                        class="appearance-none block w-full text-gray-700 border focus:border-2 focus:border-blue-400 rounded py-3 px-4 mb-3 leading-tight focus:outline-none bg-white border-gray-500"
                                        placeholder="enter patient's cin" id="patient" name="patient_id"/>
                                <%--                                <input--%>
                                <%--                                        class="appearance-none block w-full text-gray-700 border focus:border-2 focus:border-blue-400 rounded py-3 px-4 mb-3 leading-tight focus:outline-none bg-white border-gray-500"--%>
                                <%--                                        name="startDate"--%>
                                <%--                                        id="startDate"--%>
                                <%--                                        type="date"--%>
                                <%--                                />--%>
                            </div>
                        </div>
                        <div class="flex flex-wrap -mx-3 mb-6 items-end">
                            <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0">
                                <label
                                        class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2"
                                        for="medications"
                                >
                                    Medication
                                </label>
                                <div>
                                    <input
                                            class="appearance-none w-[90%] text-gray-700 border focus:border-2 focus:border-blue-400 rounded py-3 px-4 leading-tight focus:outline-none bg-white border-gray-500"
                                            placeholder="search for medication" id="medications"/>
                                    <span
                                            class="p-3 ml-1 cursor-pointer"
                                            id="medicationsBtn">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </span>

                                </div>
                            </div>
                            <div class="w-full md:w-1/2 px-3">
                                <select
                                        class="block appearance-none w-full border focus:border-2 focus:border-blue-400 text-gray-700 py-3 px-4 pr-8 rounded leading-tight focus:outline-none bg-white border-gray-500"
                                        id="medicationsSelect" hidden name="medication">
                                </select>
                            </div>
                        </div>
                        <div class="flex flex-wrap -mx-3 mb-2">


                            <div class="flex flex-col gap-3">

                            </div>


                            <div class="w-full md:w-1/3 px-3 mb-6 md:mb-0">
                                <div>
                                    <label for="attachment">Attachment</label></br>
                                    <select
                                            class="block appearance-none w-full border focus:border-2 focus:border-blue-400 text-gray-700 py-3 px-4 pr-8 rounded leading-tight focus:outline-none bg-white border-gray-500"
                                            name="attachment" id="attachment">
                                        <option selected disabled>--Select an attachment--</option>
                                        <option value="scanner">Scanner</option>
                                        <option value="analysis">Blood work</option>
                                        <option value="radio">Radio</option>
                                    </select></br>

                                </div>
                            </div>
                            <div class="w-full md:w-1/3 px-3 mb-6 md:mb-0">
                                <label
                                        class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2"
                                        for="attachment_price"
                                >
                                    Attachment price
                                </label>
                                <div class="relative">
                                    <input type="number" id="attachment_price"
                                           class="appearance-none w-[90%] text-gray-700 border focus:border-2 focus:border-blue-400 rounded py-3 px-4 leading-tight focus:outline-none bg-white border-gray-500"
                                           name="attachment_price" min="1"/>
                                </div>
                            </div>
                            <div class="w-full md:w-1/3 px-3 mb-6 md:mb-0 flex justify-end items-end">
                                <input
                                        class="bg-[#1D4584] px-6 py-2 rounded-md text-white font-semibold tracking-wide cursor-pointer"
                                        id="submit"
                                        type="submit"
                                        value="Add file"
                                />
                            </div>
                        </div>
                    </form>
                </div>
                <div class="-mx-4 sm:-mx-8 px-4 sm:px-8 py-4 overflow-x-auto" id="display">
                    <div
                            class="inline-block min-w-full shadow rounded-lg overflow-hidden"
                    >
                        <table class="min-w-full leading-normal">
                            <thead>
                            <tr>
                                <th
                                        class="px-2 py-3 border-b-2 border-gray-200 bg-gray-100 text-center text-xs font-semibold text-gray-600 uppercase tracking-wider"
                                >
                                    #
                                </th>
                                <th
                                        class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-center text-xs font-semibold text-gray-600 uppercase tracking-wider"
                                >
                                    Patient's name
                                </th>
                                <th
                                        class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-center text-xs font-semibold text-gray-600 uppercase tracking-wider"
                                >
                                    Status
                                </th>
                                <th
                                        class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-center text-xs font-semibold text-gray-600 uppercase tracking-wider"
                                >
                                    Create at
                                </th>
                                <th
                                        class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-center text-xs font-semibold text-gray-600 uppercase tracking-wider"
                                >
                                    Repayment amount (dh)
                                </th>
                                <th
                                        class="px-2 py-3 border-b-2 border-gray-200 bg-gray-100 text-center text-xs font-semibold text-gray-600 uppercase tracking-wider"
                                >
                                    Actions
                                </th>
                            </tr>
                            </thead>
                            <c:choose>
                                <c:when test="${medicalFiles != null}">
                                    <tbody>
                                    <c:forEach items="${medicalFiles}" var="medFile">
                                        <tr>
                                            <td
                                                    class="px-2 py-5 border-b border-gray-200 bg-white text-center text-sm"
                                            >
                                                <p class="text-gray-900 whitespace-no-wrap">
                                                    <c:out value="${medFile.getId()}"/>
                                                </p>
                                            </td>
                                            <td
                                                    class="px-5 py-5 border-b border-gray-200 bg-white text-center text-sm"
                                            >
                                                <p class="text-gray-900 whitespace-no-wrap">
                                                    <c:out value="${medFile.getPatient().getFullname()}"/>
                                                </p>
                                            </td>
                                            <td
                                                    class="px-5 py-5 border-b border-gray-200 bg-white text-center text-sm"
                                            >
                                                <p class="text-gray-900 whitespace-no-wrap">
                          <span
                                  class="relative inline-block px-3 py-1 font-semibold text-green-900 leading-tight"
                          >
                            <span
                                    class="absolute inset-0 bg-<c:out value="${medFile.getStatus().equals('pending') ? 'blue' :(medFile.getStatus().equals('accepted') ? 'green' :  'red') }"/>-200 opacity-50 rounded-full"
                            ></span>
                            <span class="relative"><c:out value="${medFile.getStatus()}"/></span>
                          </span>
                                                </p>
                                            </td>
                                            <td
                                                    class="px-5 py-5 border-b border-gray-200 bg-white text-center text-sm"
                                            >
                                                <p class="text-gray-900 whitespace-no-wrap">
                                                    <c:out value="${medFile.getCreatedAt()}"/>
                                                </p>
                                            </td>
                                            <td
                                                    class="px-5 py-5 border-b border-gray-200 bg-white text-center text-sm"
                                            >
                                                <p class="text-gray-900 whitespace-no-wrap">
                                                    <c:out value="${medFile.getRepayment()}"/>
                                                </p>
                                            </td>
                                            <td
                                                    class="px-5 py-5 border-b border-gray-200 bg-white text-center text-lg flex items-center justify-around"
                                            >
                                                <c:if test='${medFile.getStatus() == "pending"}'>
                                                    <form class="flex items-center justify-center"
                                                          action="${pageContext.request.contextPath}/medical_file/change_status"
                                                          method="post">
                                                        <input type="text"
                                                               name="med_file_id"
                                                               value="<c:out value='${medFile.getId()}'/>"
                                                               hidden/>
                                                        <input name="status" value="accepted" hidden/>
                                                        <button type="submit"><i
                                                                class="fa-sharp fa-solid fa-circle-check text-green-500 cursor-pointer"></i>
                                                        </button>
                                                    </form>
                                                    <form class="flex items-center justify-center"
                                                          action="${pageContext.request.contextPath}/medical_file/change_status"
                                                          method="post">
                                                        <input type="text"
                                                               name="med_file_id"
                                                               value="<c:out value='${medFile.getId()}'/>"
                                                               hidden/>
                                                        <input name="status" value="refused" hidden/>
                                                        <button type="submit"><i
                                                                class="fa-solid fa-circle-xmark text-red-500 cursor-pointer"></i>
                                                        </button>
                                                    </form>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </c:when>
                            </c:choose>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

<script>
    const toggleBtn = document.querySelector("#new")
    const title = document.querySelector("#title")
    const addForm = document.querySelector("#add")
    const display = document.querySelector("#display")

    const toggleDisplay = () => {
        if (addForm.classList.contains("hidden")) {
            toggleBtn.textContent = "Cancel"
            title.textContent = "Add file"
            addForm.classList.remove("hidden")
            display.classList.add("hidden")
        } else {
            toggleBtn.textContent = "New medical file"
            title.textContent = "Medical files"
            addForm.classList.add("hidden")
            display.classList.remove("hidden")
        }
    }

    toggleBtn.addEventListener("click", toggleDisplay)
</script>


<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>

<%--<html data-theme="light">--%>
<%--<head>--%>
<%--    <title>home -agent-</title>--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/daisyui@2.42.1/dist/full.css" rel="stylesheet" type="text/css"/>--%>
<%--    <script src="https://cdn.tailwindcss.com"></script>--%>
<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">--%>
<%--</head>--%>
<%--<body>--%>

<%--<div class="flex flex-col">--%>
<%--    <div class="navbar bg-base-100 shadow-lg">--%>
<%--        <div class="navbar-start">--%>
<%--            <a class="btn btn-ghost normal-case text-xl rounded-lg">MaCnss</a>--%>
<%--        </div>--%>
<%--        <div class="navbar-end">--%>
<%--            <a class="btn rounded-lg" style="background-color: #1D4584">Log out</a>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <div class="mt-9 min-h-[50vh] flex items-center justify-center">--%>
<%--        <form class="flex flex-col gap-9">--%>

<%--            <div>--%>
<%--                <label for="patient">Patient</label></br>--%>
<%--                <input class="input input-primary" placeholder="enter patient's id" id="patient" name="patient"/>--%>
<%--            </div>--%>

<%--            <div>--%>
<%--                <label for="medications">Medications</label></br>--%>
<%--                <input class="input input-primary" placeholder="search for medication" id="medications"/><span--%>
<%--                    class="cursor-pointer ml-5 p-4" id="medicationsBtn"><i--%>
<%--                    class="fa-solid fa-magnifying-glass"></i></span>--%>
<%--                <div class="mt-2">--%>
<%--                    <select id="medicationsSelect" hidden class="select" name="medication">--%>
<%--                    </select>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="flex flex-col gap-3">--%>
<%--                <div>--%>
<%--                    <label for="attachment">Attachment</label></br>--%>
<%--                    <select class="select select-primary" name="attachment" id="attachment">--%>
<%--                        <option selected disabled>--Select an attachment--</option>--%>
<%--                        <option value="scanner">Scanner</option>--%>
<%--                        <option value="analysis">Blood work</option>--%>
<%--                        <option value="radio">Radio</option>--%>
<%--                    </select></br>--%>

<%--                </div>--%>
<%--                <div>--%>
<%--                    <label>price</label></br>--%>
<%--                    <input type="number" class="input input-primary" name="attachment_price" min="1"/>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div>--%>
<%--                <input type="submit" value="add file" placeholder="attachment price" class="btn rounded-lg" style="background-color: #1D4584"/>--%>
<%--            </div>--%>
<%--        </form>--%>
<%--    </div>--%>
<%--</div>--%>

<%--</body>--%>
<%--</html>--%>

<script>
    const medications =
    ${medications}
    const patientBtn = document.querySelector("#patientBtn")
    const medicationsBtn = document.querySelector("#medicationsBtn")
    const medsSearch = document.querySelector("#medications")
    const medicationsSelect = document.querySelector("#medicationsSelect")

    console.log(medications)

    medicationsBtn.addEventListener("click", () => {
        searchForMedications(medsSearch.value)
    })

    const searchForMedications = (value) => {
        if (value.trim().length == 0) return
        const resMeds = medications.filter(med => med.entitled?.includes(value))
        console.log(resMeds)
        let newValue = `<option selected disabled>--Select medication--</option>`
        resMeds.forEach(med => {
            newValue += `
            <option value="` + med.id + `">` + med.entitled + ` | ` + med.publicPrice + ` dh</option>
`
        })
        medicationsSelect.innerHTML = newValue
        medicationsSelect.removeAttribute("hidden")
    }
</script>
