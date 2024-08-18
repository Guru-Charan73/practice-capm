module.exports = cds.service.impl(async function () {

    //Step 1: get the object of our odata entities
    const { EmployeeSet, POs } = this.entities;

    this.before('UPDATE', EmployeeSet, (req) => {
        var salary = parseInt(req.data.salaryAmount);
        if (salary >= 1000000) {
            req.error(500, "Ola! sorry no one can get this salary in my org");
        }
    });

    this.before('*', EmployeeSet, (req) => {
        var salary = parseInt(req.data.salaryAmount);
        if (salary >= 1000000) {
            req.error(500, "Ola! sorry no one can get this salary in my org");
        }
    })
}
);